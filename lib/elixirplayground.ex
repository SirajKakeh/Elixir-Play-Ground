defmodule Elixirplayground do
  @moduledoc """
  Documentation for Elixirplayground.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Elixirplayground.hello
      :world

  """
  import IO #, only: [puts: 1]
  import File
  import Path
  def find(path \\ ".") do
    if(Enum.at(wildcard("#{path}/*.exs"),0) != []) do
      puts()
    end
    # if(regular?(path)) do
    #   Path.wildcard("./*.exs")
    #   |> Enum.at(0)
    #   |> puts()
    #   # puts Enum.at Path.wildcard("./*.exs"), 0
    # end

    # puts Path.wildcard("#{cwd!()}/**/*.wtev")

    # cwd!()
    # |> ls!()
    # |> Enum.each(&puts &1)
  end

  def ls_r(path \\ ".") do
    cond do
      File.regular?(path) -> [path]
      File.dir?(path) ->
        File.ls!(path)
        |> Enum.map(&Path.join(path, &1)) #(fn (File.ls!(path)) -> Path.join(path, File.ls!(path)) end)
        |> Enum.map(&ls_r/1)
        |> Enum.join(" ..., ")
      true -> []
    end
  end
  
end

Elixirplayground.find()
# IO.puts Filesearch.ls_r(File.cwd!())