defmodule BlogWeb.Parser.Html do
  def to_html(line) do
    line
    |> render_title()
    |> render_img()
    |> render_italic()
    |> render_line()
    |> render_paragraph()
  end

  defp render_title(text) do
    Regex.replace(~r/\#((?!\+)[^*]+)/, text, fn _, match ->
      "<h1 class=\"md:text-2xl lg:text-6xl mb-6 text-2xl font-black leading-none tracking-tight text-white text-center\">#{match}</h1>"
    end)
  end

  defp render_img(text) do
    case String.contains?(text, ".png") do
      true -> "<img class=\"w-3/5 mx-auto my-4 pt-4\" src=\"/images/#{text}\">"
      _ -> text
    end
  end

  defp render_italic(text) do
    Regex.replace(~r/_([^_]+)_/, text, fn _, match ->
      "<em class=\"text-white font-semibold\">#{match}</em>"
    end)
  end

  defp render_line(text) do
    String.replace(
      text,
      "---",
      "<hr class=\"w-1/2 h-1 mx-auto my-4 bg-white border-0 rounded md:my-10\">"
    )
  end

  defp render_paragraph(text) do
    cond do
      String.match?(text, ~r/.*(h1|<hr|<em|<img|<a).*/) ->
        text

      String.contains?(text, "PreviewPost") ->
        render_prev_link(text)

      String.contains?(text, "NextPost") ->
        render_next_link(text)

      true ->
        "<p class=\"font-semibold text-white pt-4 text-lg\"> #{text} </p>"
    end
  end

  defp render_next_link(text) do
    [_, post] = String.split(text, " ")

    "<p class=\"mt-16 absolute right-60 \"><a class=\"text-xl w-20\" href=\"/blog/#{post}\"><svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"none\" viewBox=\"0 0 24 24\" strokeWidth={1.5} stroke=\"currentColor\">
    <path strokeLinecap=\"round\" strokeLinejoin=\"round\" d=\"M17.25 8.25L21 12m0 0l-3.75 3.75M21 12H3\" />
  </svg>Next
   </a><p>"
  end

  defp render_prev_link(text) do
    [_, post] = String.split(text, " ")

    "<p class=\"mt-16 absolute\"><a class=\"text-xl w-20\" href=\"/blog/#{post}\"><svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"none\" viewBox=\"0 0 24 24\" strokeWidth={1.5} stroke=\"currentColor\">
    <path strokeLinecap=\"round\" strokeLinejoin=\"round\" d=\"M6.75 15.75L3 12m0 0l3.75-3.75M3 12h18\" />
  </svg>Prev</a><p>"
  end
end
