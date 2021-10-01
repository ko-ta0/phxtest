defmodule Hello do
    def message(name \\ "world") do
        "Calc, #{name}!"
    end
end

IO.puts(Hello.message("Alice"))
IO.puts(Hello.message("Bob"))
IO.puts(Hello.message)