defmodule BlogWeb.Layouts do
  use BlogWeb, :html

  embed_templates "layouts/*"

  def navbar(assigns) do
    ~H"""
    <header class="flex items-center justify-between py-8 px-[10%] mt-2">
      <nav>
        <ul class="">
          <li class="inline-block py-0 px-5"><a class="no-underline" href="/">Posts</a></li>
          <li class="inline-block py-0 px-5">
            <a class="no-underline" href="#">Projects</a>
          </li>
          <li class="inline-block py-0 px-5"><a class="no-underline" href="#">About</a></li>
        </ul>
      </nav>
      <a href="#" class="no-underline">Contact</a>
    </header>
    """
  end

  def footer(assigns) do
    ~H"""
    <footer class="md:flex md:items-center md:justify-between flex items-center py-10 mt-24 border-t">
      <span class="sm:text-center text-sm text-white">
        © <%= DateTime.utc_now().year %> Personal Blog.
        Crafted with <span class="text-pink-600">♥</span>
        by <a href="https://github.com/TeoDiaz" class="underline text-white" target="_blank">Teo Diaz</a>.
      </span>
      <ul class="flex flex-wrap items-center text-sm text-white">
        <li>
          <a href="https://github.com/TeoDiaz" class="underline text-white" target="_blank">
            Source code
          </a>
        </li>
      </ul>
    </footer>
    """
  end
end
