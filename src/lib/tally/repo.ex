defmodule Tally.Repo do
  use Ecto.Repo,
    otp_app: :tally,
    adapter: Ecto.Adapters.SQLite3
end
