defmodule Nexus.MQTT.Supervisor do
  use Supervisor
  import Ecto.Query, only: [from: 2]

  @default_mqtt_host "localhost"
  @default_mqtt_port 1883

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    mqtt_config = Application.get_env(:nexus, Nexus.MQTT.Supervisor)

    # Try to use the configured `host` and `port` values, but provide defaults
    # in the event they have not been specified.
    host = Keyword.get(mqtt_config, :host, @default_mqtt_host)
    port = Keyword.get(mqtt_config, :port, @default_mqtt_port)

    # Subscriptions can be configured by the user, and therefore must be loaded
    # from the database.
    #
    # TODO: a method of reloading or adding/removing subscriptions will
    #       eventually be required in order to allow for changes at runtime
    query =
      from s in Nexus.Data.Subscription,
        select: s.topic

    subscriptions = Nexus.Repo.all(query)

    # Start the Tortoise connection manager, specifying our custom message
    # handler module as well as the list of subscriptions.
    children = [
      {Tortoise.Connection,
       [
         client_id: Nexus,
         handler: {Nexus.MQTT.Handler, []},
         server: {Tortoise.Transport.Tcp, host: host, port: port},
         subscriptions: subscriptions
       ]}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
