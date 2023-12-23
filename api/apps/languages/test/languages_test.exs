defmodule LanguagesTest do
  use ExUnit.Case
  doctest Languages

  test "greets the world" do
    assert Languages.hello() == :world
  end
end
