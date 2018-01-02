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
  # import IO #, only: [puts: 1]
  # import File
  # import Path

  # def find(path \\ ".") do
  #   Enum.map(ls!(path), fn (el) -> 
  #     puts el
  #     if(el |> dir?) do
  #       find(el)
  #     else
  #       # puts(el)
  #       if(String.match?(el, ~r/.srj/)) do
  #         puts("fooooooooooooooooooooooound it at #{el}")
  #       end
  #     end
  #   end)
  # end

  def find(filepath) do
    if(String.match?(filepath, ~r/.srj/)) do
      IO.puts("ooooooooooooooooooooooooooooooooooooooooooooooooooooook #{filepath}")
    else
      expand(File.ls(filepath), filepath)
    end
  end

  def expand({:ok, files}, path) do
    files
    |> Enum.flat_map(fn (el) -> find("#{path}/#{el}")
    end)
  end

  def expand({:error, _}, path) do 
    [path]
  end


  # def find(path \\ ".") do
  #   cond do
  #     Path.wildcard(Path.join(path, "*.{srj}")) != [] ->
  #       IO.puts("successsssssssssssssssssssssssssssssssss at #{path}")
  #     File.dir?(path) ->
  #       File.ls!(path)
  #       |> Enum.map(&Path.join(path, &1)) #(File.ls!(path), Path.join(path, File.ls!(path)) end)
  #       |> Enum.map(&find/1)
  #       |> Enum.concat()
  #       |> IO.puts()
  #     true -> []
  #   end
  # end

  # def list(path \\ ".") do
  #   cond do
  #     File.regular?(path) -> [path]
  #     File.dir?(path) ->
  #       File.ls!(path)
  #       |> Enum.map(&Path.join(path, &1)) #(fn (File.ls!(path)) -> Path.join(path, File.ls!(path)) end)
  #       |> Enum.map(&list/1)
  #       |> Enum.concat()
  #     true -> []
  #   end
  # end

  # def testRegex(str, regex) do
  #   IO.puts(String.match?(str, regex))
  # end
end

Elixirplayground.find(".")
# IO.puts Filesearch.ls_r(File.cwd!())
# Elixirplayground.testRegex(".aasiakllprime/ujgnwf.srj", ~r/.srj/)