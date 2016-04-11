defmodule Dockeliver.HookController do
  use Dockeliver.Web, :controller

  def github(conn, %{"url" => url}) do
    Dockeliver.Worker.Download.start url
    conn
      |> put_status(202)
      |> text(url)
  end
end
