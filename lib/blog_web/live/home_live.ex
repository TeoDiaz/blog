defmodule BlogWeb.HomeLive do
  use BlogWeb, :live_view

  @mock_blogs [
    %{
      id: "hello_world",
      title: "What is console.log(\"Hello World\")?",
      tag: "personal",
      description: "Let's start from the beginning",
      img_name: "hello_world",
      date: "22-08-2018"
    },
    %{
      id: "dare",
      title: "To improve, you have to dare",
      tag: "personal",
      description: "How things started to happen",
      img_name: "way",
      date: "26-08-2018"
    },
    %{
      id: "pre_work",
      title: "Pre-Work and day -1",
      tag: "personal",
      description: "My new team, my new goal",
      img_name: "day1_retiro",
      date: "26-08-2018"
    },
    %{
      id: "first_week",
      title: "The first week of the rest of my life",
      tag: "personal",
      description: "All the things I'm learning",
      img_name: "vikings",
      date: "28-08-2018"
    }
  ] |> Enum.reverse()

  @impl LiveView
  def mount(_params, _session, socket) do
    socket = assign(socket, mock_blogs: @mock_blogs, page_title: "Home")

    {:ok, socket}
  end

  @impl LiveView
  def render(assigns) do
    ~H"""
    <section>
      <div class="lg:py-16 lg:px-12 px-4 py-8 mx-auto text-center">
        <h1 class="md:text-5xl lg:text-6xl mb-6 text-4xl font-black leading-none tracking-tight text-white">
          Saying hello to the world
        </h1>
        <p class="lg:text-2xl sm:px-16 xl:px-48 text-lg font-semibold text-white">
          From paratrooper to software engineer
        </p>
      </div>
    </section>
    <section>
      <div class="lg:px-12 px-4 mx-auto">
        <h2 class="md:text-3xl mb-16 text-3xl font-bold text-center text-white">
          Latest Posts
        </h2>
        <div class="grid grid-cols-2 lg:grid-cols-3 gap-6">
          <%= for blog <- @mock_blogs do %>
            <.link navigate={~p"/blog/#{blog.id}"}>
              <BlogWeb.HomeLive.PostCard.card
                title={blog.title}
                tag={blog.tag}
                description={blog.description}
                img_name={blog.img_name}
                date={blog.date}
              />
            </.link>
          <% end %>
        </div>
      </div>
    </section>
    """
  end
end
