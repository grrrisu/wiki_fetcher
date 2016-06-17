defmodule WikiFetcher.Page do

  @url "https://de.wikipedia.org/wiki"
  @browser [ {"User-agent", "Elixir WikiFetcher"} ]

  def download(term) do
    term
    |> url
    |> HTTPoison.get(@browser)
    |> handle_response
    |> parse_html
  end

  def url(term) do
    "#{@url}/#{term}"
  end

  def handle_response( {:ok, %{status_code: 200, headers: headers, body: body} ) do
    {:ok, headers: headers, body: body}
  end

  def handle_response( {___, %{status_code: ___, headers: headers, body: body} ) do
    {:error, headers: headers, body: body}
  end

  def parse_html({:ok, _headers, body}) do
    IO.puts Floki.find("h1")
  end

  def parse_html({:error, headers, body}) do
    IO.puts("download failed! #{headers} #{body}")
  end

end
