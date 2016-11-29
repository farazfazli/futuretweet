defmodule FutureTweet do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: FutureTweet.Worker.start_link(arg1, arg2, arg3)
      worker(FutureTweet.TweetServer, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FutureTweet.Supervisor]
    process = Supervisor.start_link(children, opts)
    # Defaults to every 30 mins, pass custom CRON as first arg to change
    FutureTweet.Scheduler.schedule_file(Path.join("#{:code.priv_dir(:future_tweet)}", "tweets.txt"))
    # Return process
    process
  end
end
