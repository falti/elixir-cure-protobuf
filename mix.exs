defmodule Ipc.Mixfile do
  use Mix.Project

  def project do
    [app: :ipc,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: Mix.compilers ++ [:cure, :"cure.deps"],
    aliases: aliases, # Configure aliases
     deps: deps
   ]

  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  defp aliases do
    # Execute the usual mix clean and our Makefile clean task
    [clean: ["clean", "clean.make"]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:exprotobuf, "~> 0.8.5"},
      {:gpb, github: "tomas-abrahamsson/gpb", tag: "3.17.2"},
      #{:poolboy, github: "devinus/poolboy", tag: "1.5.1"},
      {:cure, "~> 0.4.0"}
    ]
  end

  def clean_cpp(_) do
    {result, _error_code} = System.cmd("make", ['clean'], stderr_to_stdout: true)
    Mix.shell.info result
  end
end

defmodule Mix.Tasks.Clean.Make do
  @shortdoc "Cleans helper in c_src"

  def run(_) do
    {result, _error_code} = System.cmd("make", ['clean'], stderr_to_stdout: true, cd: "./c_src")
    Mix.shell.info result

    :ok
  end
end
