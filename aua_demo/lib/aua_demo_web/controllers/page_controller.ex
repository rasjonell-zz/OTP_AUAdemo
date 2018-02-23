defmodule AuaDemoWeb.PageController do
  use AuaDemoWeb, :controller
  import Task

  def index(conn, _params) do
    render conn, "index.html"
  end

  def fact(conn, %{"num" => num}) do
    number = String.to_integer(num)

    task = Task.async(fn -> 
      send({Factorial, :"factorial@localhost"}, {:fact, {self(), node(), number}})

      receive do
        :error ->
          :error
        num -> 
          {:ok, num}
      end
    end)

    case yield(task) || shutdown(task) do
      {:ok, num} -> 
        conn
        |> put_flash(:info, "#{num |> elem(1)}")
          |> render("index.html")
      _ ->
        conn
          |> put_flash(:error, "Invalid Input. Try again.")
          |> render("index.html")
    end
    
  end
  
end
