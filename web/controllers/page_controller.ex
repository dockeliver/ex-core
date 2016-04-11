defmodule Dockeliver.PageController do
  use Dockeliver.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
