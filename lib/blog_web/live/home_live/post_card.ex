defmodule BlogWeb.HomeLive.PostCard do
  use BlogWeb, :live_component

  def card(assigns) do
    ~H"""
    <div class="hover:shadow-xl hover:scale-105 transition-all flex flex-col max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow-md box-content">
      <img class="rounded-lg cursor-pointer mb-6 h-48" src={"/images/#{@img_name}.png"} alt={@img_name} />
      <h3 class="md:text-lg mb-2 text-lg font-bold tracking-tight text-gray-900">
        <%= @title %>
      </h3>
      <p class="font-normal text-gray-600 mb-2">
        <%= @description %>
      </p>
      <h4 class="mb-1 text-sm font-semibold text-purple-700"><%= @tag %></h4>
    </div>
    """
  end
end
