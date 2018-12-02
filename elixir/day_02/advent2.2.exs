#! /usr/bin/env elixir

# --- Part Two ---
# Confident that your list of box IDs is complete, you're ready to find the boxes full of prototype fabric.
#
# The boxes will have IDs which differ by exactly one character at the same position in both strings. For example, given the following box IDs:
#
# abcde
# fghij
# klmno
# pqrst
# fguij
# axcye
# wvxyz
#
# The IDs abcde and axcye are close, but they differ by two characters (the second and fourth). However, the IDs fghij and fguij differ by exactly one character, the third (h and u). Those must be the correct boxes.
#
# What letters are common between the two correct box IDs? (In the example above, this is found by removing the differing character from either ID, producing fgij.)

defmodule Boxes do
  alias __MODULE__

  def common_letters(ids) do
    [[a, b]] = differences_of_one(ids)

    [String.codepoints(a), String.codepoints(b)]
    |> Enum.zip()
    |> Enum.reject(fn {a, b} ->
      a != b
    end)
    |> Enum.map(fn {a, _} ->
      a
    end)
    |> Enum.join
  end

  defp differences(a, b) do
    [String.codepoints(a), String.codepoints(b)]
    |> Enum.zip()
    |> Enum.filter(fn {a, b} ->
      a != b
    end)
    |> Enum.count()
  end

  defp differences_of_one(ids) do
    combinations = for a <- ids, b <- ids, do: Enum.sort([a, b])
    Enum.filter(Enum.uniq(combinations), fn [a, b] ->
      differences(a, b) == 1
    end)
  end
end

IO.read(:stdio, :all)
|> String.split("\n")
|> Boxes.common_letters()
|> IO.puts()
