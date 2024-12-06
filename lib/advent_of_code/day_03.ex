defmodule AdventOfCode.Day03 do
  def part1(input) do
    Regex.scan(~r/mul\(\d+,\d+\)/, input)
    |> Enum.map(fn match ->
      calc(match)
    end)
    |> Enum.sum()
  end

  def part2(_args) do
  end

  def calc(["mul(" <> rest]) do
    rest
    |> String.trim(")")
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce(1, fn val, acc -> val * acc end)
  end
end
