defmodule Elixirplayground do
  @moduledoc """
  """

  @doc """
  """
  def find(path \\ ".", root \\ "") do
    if(root == "", do: root = path)
    Enum.map(File.ls!(path), fn (el) -> 
      if "#{path}/#{el}" |> File.dir? do
        find("#{path}/#{el}", root)
      else
        if(String.match?(el, ~r/.srj|.Srj|.SRJ/) && path != root) do
          File.rename("#{path}/#{el}", "./#{el}")
        else
          []
        end
      end
    end)
  end
end

Elixirplayground.find(".")
