defmodule FileManipulator do
  def zip(zip_file, file_list, cwd) do
    :zip.zip(to_charlist(zip_file), Enum.map(file_list, &to_charlist/1), [
      {:cwd, to_charlist(cwd)}
    ])
  end
end

FileManipulator.zip("newFile.zip", ["/home/siraj/Desktop/Elixir-Play-Ground/1/hehe.srr"], "/home/siraj/Desktop/Elixir-Play-Ground/1/")
