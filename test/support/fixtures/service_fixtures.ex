defmodule TailwindSample.ServiceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TailwindSample.Service` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        message: "some message"
      })
      |> TailwindSample.Service.create_post()

    post
  end
end
