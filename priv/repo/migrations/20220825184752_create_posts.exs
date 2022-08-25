defmodule TailwindSample.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :message, :text

      timestamps()
    end
  end
end
