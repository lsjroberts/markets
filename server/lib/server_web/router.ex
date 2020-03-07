defmodule ServerWeb.Router do
  use ServerWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(CORSPlug)
  end

  scope "/" do
    pipe_through(:api)

    forward("/api", Absinthe.Plug,
      schema: ServerWeb.Schema,
      analyze_complexity: true,
      max_complexity: 1000,
      json_codec: Jason
    )

    forward("/graphiql", Absinthe.Plug.GraphiQL,
      schema: ServerWeb.Schema,
      interface: :simple,
      context: %{pubsub: ServerWeb.Endpoint}
    )
  end
end
