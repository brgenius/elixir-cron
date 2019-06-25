defmodule Cron.Worker do
  use GenServer

  require Logger

  def start_link(params) do
    GenServer.start_link(__MODULE__, params)
  end

  @impl true
  def init(state) do
    work()
    {:ok, 1}
  end

  # def handle_call(request, from, state) do
  #
  # end
  #
  # def handle_cast(request, state) do
  #
  # end

  @impl true
  def handle_info(:work, state) do

    # spawn(fn ->
    if rem(state, 5) == 0 do
      raise "não pode ser divisível por zero"
    end
    Logger.info("Olá test #{state}")
    # end)

    work()
    {:noreply, state + 1}
  end

  defp work() do
    Process.send_after(self(), :work, 5_000)
  end
end
