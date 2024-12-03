defmodule AdventOfCode.Day01 do
  def part1(input) do
    input
    |> parse_input()
    |> Enum.map(&Enum.sort/1)
    |> Enum.zip()
    |> Enum.map(fn {l, r} -> abs(l - r) end)
    |> Enum.sum()
  end

  def part2(input) do
    [l, r] = parse_input(input)

    cache = Enum.frequencies(r)

    Enum.reduce(l, 0, fn val, acc ->
      acc + val * Map.get(cache, val, 0)
    end)
  end

  defp parse_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn row ->
      row
      |> String.split()
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.zip_with(&Function.identity/1)
  end
end
