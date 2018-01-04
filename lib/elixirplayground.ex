defmodule Elixirplayground do
  @moduledoc """
  """

  @doc """
  """
  def find(path \\ ".") do
    Enum.map(File.ls!(path), fn (el) -> 
      if "#{path}/#{el}" |> File.dir? do
        find("#{path}/#{el}")
      else
        if(String.match?(el, ~r/.srj/) && path != ".") do
          File.rename("#{path}/#{el}", "./#{el}")
        else
          []
        end
      end
    end)
  end
end

Elixirplayground.find(".")
