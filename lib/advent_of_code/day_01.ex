defmodule AdventOfCode.Day01 do
  def part1(input) do
    input
    |> parse_input()
    |> then(fn [l, r] ->
      [Enum.sort(l), Enum.sort(r)]
    end)
    |> Enum.zip()
    |> Enum.map(fn {l, r} -> abs(l - r) end)
    |> Enum.sum()
  end

  def part2(input) do
    [l, r] =
      input
      |> parse_input()

    Enum.reduce(l, {0, %{}}, fn val, {res, cache} ->
      cache =
        Map.put_new_lazy(cache, val, fn ->
          Enum.count(r, &(&1 == val))
        end)

      {res + val * Map.get(cache, val), cache}
    end)
    |> elem(0)
  end

  defp parse_input(input) do
    input
    |> String.split("\n")
    |> :lists.droplast()
    |> Enum.reduce([[], []], fn line, acc ->
      [l, r] = String.split(line)
      l = String.to_integer(l)
      r = String.to_integer(r)

      [tot_l, tot_r] = acc

      tot_l = [l | tot_l]
      tot_r = [r | tot_r]

      [tot_l, tot_r]
    end)
  end
end
