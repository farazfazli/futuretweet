defmodule FutureTweet.FileReader do
	def get_strings_to_tweet(path) do
		# Read from path
		File.read!("/Users/farazfazli/Documents/elixir/future_tweet/priv/tweets.txt")
		# Split at new line
		|> String.split("\n")
		# I prefer anon funcs without the &(...) shortcut
		# Pipe and map each to trim function
		|> Enum.map(fn str -> String.trim(str) end)
		# Filter less than 140 characters
		|> Enum.filter(fn str -> String.length(str) <= 140 and String.length(str) >= 5 end)
		# Pull random line from file
		|> Enum.random()
	end
end