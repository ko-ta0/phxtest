defmodule PhxtestWeb.HelloController do
    use PhxtestWeb, :controller

    def show(conn, params) do
        render(conn, "show.html",name: params["name"]||"world")
    end
end