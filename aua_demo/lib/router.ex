defmodule Router do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: Router)
  end

  def handle_info(msg, state) do
    spawn(fn -> forward_msg(msg) end)
    {:noreply, state}
  end
  
  defp forward_msg({:ok, pid, num}) do
    send(pid, num)
  end
end
