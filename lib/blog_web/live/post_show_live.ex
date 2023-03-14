defmodule BlogWeb.PostShowLive do
  use BlogWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, page_title: "PostShow", html: nil)

    {:ok, socket}
  end

  @posts_path "priv/static/_posts/"

  def handle_params(params, _uri, socket) do
    with {:ok, id} <- Map.fetch(params, "id"),
         {:ok, md} <- File.read(@posts_path <> "#{id}.md") do
      socket
      |> assign(html: parse(md))
      |> then(&{:noreply, &1})
    else
      _ ->
        socket
        |> then(&{:noreply, &1})
    end
  end

  def render(assigns) do
    ~H"""
    <div class="lg:py-16 lg:px-12 px-4 py-8 mx-auto w-4/5">
      <%= raw(@html) %>
    </div>
    """
  end

  defp parse(md) do
    md
    |> String.split("\n\n")
    |> Enum.map(fn line ->
      BlogWeb.Parser.Html.to_html(line)
    end)
  end
end
