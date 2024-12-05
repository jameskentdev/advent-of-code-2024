defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  setup do
    input = """
    1 3 6 7 9
    1 2 7 8 9
    7 6 4 2 1
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    """

    %{input: input}
  end

  test "part1", %{input: input} do
    result = part1(input)

    IO.inspect(result)

    assert result
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
