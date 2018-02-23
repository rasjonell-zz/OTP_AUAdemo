defmodule Factorial do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: Factorial)
  end

  def handle_info({:fact, {pid, node, num}}, state) do
    factorial_next(pid, node, num)
    {:noreplay, state}
  end

  defp factorial_next(pid, node, num) do
    send({Router, node}, {:ok, pid, factorial(num)})
  end

  defp factorial(num) when num < 0, do: :error
  defp factorial(0), do: 1
  defp factorial(num), do: num * factorial(num-1)
end
