defmodule FutureTweet.TweetServer do
	# GenServer is a behavior, like an interface
	use GenServer

	# Name server :tweet_server
	def start_link() do
		GenServer.start_link(__MODULE__, :ok, name: 
			:tweet_server)
	end

	def init(:ok) do
		{:ok, %{}}
	end

	# handle_cast is async
	def handle_cast({:tweet, tweet}, _) do
		FutureTweet.Tweet.send(tweet)
		{:noreply, %{}}
	end

	def tweet(tweet) do
		GenServer.cast(:tweet_server, {:tweet, tweet})
	end
end