defmodule TailwindSample.ServiceTest do
  use TailwindSample.DataCase

  alias TailwindSample.Service

  describe "posts" do
    alias TailwindSample.Service.Post

    import TailwindSample.ServiceFixtures

    @invalid_attrs %{message: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Service.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Service.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{message: "some message"}

      assert {:ok, %Post{} = post} = Service.create_post(valid_attrs)
      assert post.message == "some message"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Service.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{message: "some updated message"}

      assert {:ok, %Post{} = post} = Service.update_post(post, update_attrs)
      assert post.message == "some updated message"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Service.update_post(post, @invalid_attrs)
      assert post == Service.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Service.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Service.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Service.change_post(post)
    end
  end
end
