defmodule WikiFetcherTest do
  use ExUnit.Case
  doctest WikiFetcher

  import WikiFetcher.CLI

  test "fetch HMTL" do
    WikiFetcher.CLI.fetch("M42")
  end

end
