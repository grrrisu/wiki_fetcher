defmodule WikiFetcher.CLI do

  def run(term) do
    term
    |> fetch
  end

  def fetch(term) do
    IO.puts "fetching #{term}"
  end

end
