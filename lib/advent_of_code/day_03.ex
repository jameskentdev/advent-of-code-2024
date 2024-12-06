defmodule AdventOfCode.Day03 do
  def part1(input) do
    Regex.scan(~r/mul\(\d+,\d+\)/, input)
    |> Enum.map(fn match ->
      ["mul(" <> rest] = match

      rest
      |> String.trim(")")
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
      |> Enum.reduce(1, fn val, acc -> val * acc end)
    end)
    |> Enum.sum()
  end

  def part2(input) do
    ~r/(mul)\((\d{1,3}),(\d{1,3})\)|do\(\)|don't\(\)/
    |> Regex.scan(input)
    |> Enum.reduce({0, true}, fn match, {result, continue?} ->
      case {match, continue?} do
        {["don't()"], false} -> {result, false}
        {["don't()"], true} -> {result, false}
        {["do()"], false} -> {result, true}
        {["do()"], true} -> {result, true}
        {[_, "mul", a, b], true} -> {String.to_integer(a) * String.to_integer(b) + result, true}
        {[_, "mul", _a, _b], false} -> {result, false}
      end
    end)
    |> elem(0)
  end
end
