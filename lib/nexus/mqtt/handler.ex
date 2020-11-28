defmodule Nexus.MQTT.Handler do
  use Tortoise.Handler

  def handle_message(topic, payload, state) do
    case Jason.decode(payload) do
      {:ok, payload} ->
        # TODO: insert the data into the database
        # TODO: broadcast the payload to the appropriate PubSub topic
        IO.inspect(topic)
        IO.inspect(payload)

      {:error, reason} ->
        # TODO: proper error handling (using Logger probably?)
        IO.puts(:stderr, reason)
    end

    {:ok, state}
  end
end
