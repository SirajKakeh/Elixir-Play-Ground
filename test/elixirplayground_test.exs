defmodule ElixirplaygroundTest do
  use ExUnit.Case
  doctest Elixirplayground

  test "greets the world" do
    assert Elixirplayground.hello() == :world
  end
end
