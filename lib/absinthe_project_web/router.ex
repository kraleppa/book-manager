defmodule AbsintheProjectWeb.Router do
  use AbsintheProjectWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward("/graphql", Absinthe.Plug, schema: AbsintheProjectWeb.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL, schema: AbsintheProjectWeb.Schema)
    end
  end
end
