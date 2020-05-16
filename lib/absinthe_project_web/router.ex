defmodule AbsintheProjectWeb.Router do
  use AbsintheProjectWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward("/graphql", Absinthe.Plug, schema: AbsintheProject.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL, schema: AbsintheProject.Schema)
    end
  end
end
