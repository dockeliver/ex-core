defmodule Dockeliver.Router do
  use Dockeliver.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Plug.Parsers, parsers: [:urlencoded, :multipart, :json]
  end

  scope "/", Dockeliver do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", Dockeliver do
    pipe_through :api

    post "/hook/github", HookController, :github
  end
end
