defmodule Elixirplayground do
  @moduledoc """
  """

  @doc """
  """
  def find(path \\ ".", root \\ "") do
    root = case root do
      "" -> path
      _ -> root
    end
    Enum.map(File.ls!(path), fn (el) -> 
      if "#{path}/#{el}" |> File.dir? do
        find("#{path}/#{el}", root)
      else
        if(String.match?(el, ~r/.srj|.Srj|.SRJ/) && path != root) do
          File.rename("#{path}/#{el}", "#{root}/#{el}")
          objFilePath = "#{path}/*.{srr,Srr,SRR}"
          |> Path.wildcard()
          |> Enum.at(0)
          if(objFilePath) do
            objNameList = objFilePath |> String.split(".")
            objName = objNameList |> Enum.at(length(objNameList)-2)
            objName = cond do
              objName |> String.split("/") |> length > 1 -> objName |> Path.basename
              true -> objName
            end
            objExt = objNameList |> Enum.at(length(objNameList)-1)
            File.rename("#{path}/#{objName}.#{objExt}", "#{root}/#{objName}.#{objExt}")
          end
        else
          []
        end
      end
    end)
  end


  def checkWhether_a_File?() do
    File.cwd! 
    |> File.ls!
    |> Enum.filter(fn(el) -> !File.dir?(el) end)
    |> IO.inspect 
  end
end

# Elixirplayground.find(".")
# Elixirplayground.checkWhether_a_File()
