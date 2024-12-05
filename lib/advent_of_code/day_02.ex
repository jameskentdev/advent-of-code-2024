defmodule AdventOfCode.Day02 do
  def part1(input) do
    input
    |> parse_input()
    |> Enum.count(&check/1)
  end

  def part2(input) do
    input
    |> parse_input()
    |> Enum.count(fn level ->
      check(level) or
        Enum.any?(0..length(level), &check(List.delete_at(level, &1)))
    end)
  end

  defp parse_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn row ->
      row
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)
    end)
  end

  defp check([a, a | _tail]), do: false

  defp check([a, b | _tail] = list) when a > b do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.all?(fn [a, b] ->
      a > b and abs(a - b) <= 3
    end)
  end

  defp check([a, b | _tail] = list) when a < b do
    Enum.chunk_every(list, 2, 1, :discard)
    |> Enum.all?(fn [a, b] ->
      a < b and abs(a - b) <= 3
    end)
  end
end
