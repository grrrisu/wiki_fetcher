defmodule WikiFetcher.Page do

  @url "https://de.wikipedia.org/wiki"
  @browser [ {"User-agent", "Elixir WikiFetcher"} ]

  def download(term) do
    term
    |> url
    |> HTTPoison.get(@browser)
    |> handle_response
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

end
