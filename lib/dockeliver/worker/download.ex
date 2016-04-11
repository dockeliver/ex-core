defmodule Dockeliver.Worker.Download do
  use GenServer

  ## Client API

  @doc """
  Starts the download worker.
  """
  def start_link do
    GenServer.start_link(__MODULE__, :ok, [])
  end

  @doc """
  start a download
  """
  def start(server, payload) do
    GenServer.cast(__MODULE__, {:download, payload})
  end

  ## Server Callbacks

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast({:download, payload}, state) do
    IO.inspect payload
    {:noreply, state}
  end
end
