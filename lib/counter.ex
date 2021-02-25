defmodule Counter do
  def start(value) do
    receive do
      :increment -> start(value + 1)
      {:get, pid} -> send(pid, value)
    end
  end

end
