defmodule TailwindSample.Repo do
  use Ecto.Repo,
    otp_app: :tailwind_sample,
    adapter: Ecto.Adapters.MyXQL
end
