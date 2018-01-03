defmodule ToyProblems do
  @moduledoc """
  ## Toy Problems
  ##### This document holds solutions to toy problems solved in Elixir, mainly from [CodeWars.com](https://www.codewars.com).
  """
  def main() do
    IO.inspect is_uppercase?("DDD #DDD")
  end

  @doc """
  #### My Solution
  """
  def upper_case?(str), do: String.upcase(str) == str

  @doc """
  #### Formatting decimal places #0
  """
  def two_decimal_places(n), do: Float.round(n, 2)

  @doc """
  #### Counting sheep...
  """
  def count_sheeps(sheeps), do: Enum.reduce(sheeps, 0, fn(el, acc) ->
    cond do
      el==true -> acc+1
      true -> acc
    end
  end)

  @doc """
  #### Vowel Count
  """
  def get_count(str), do: Enum.reduce(String.graphemes(str), 0, fn(el, acc) ->
    cond do
      el =~ ~r/[aeuio]/i -> acc+1
      true -> acc
    end
  end)

  @doc """
  #### Is the string uppercase?
  """
  def is_uppercase?(str), do: str =~ ~r/^[^a-z]*$/
end
ToyProblems.main()