defmodule FutureTweet.Tweet do
	# Sends a Tweet
	def send(str) do
		ExTwitter.configure(:process, [
		consumer_key: System.get_env("TWITTER_CONSUMER_KEY"),
  		consumer_secret: System.get_env("TWITTER_CONSUMER_SECRET"),
  		access_token: System.get_env("TWITTER_ACCESS_KEY"),
  		access_token_secret: System.get_env("TWITTER_ACCESS_SECRET")
  	]
)

		#IO.puts ExTwitter.configure

		# Send out tweet
		ExTwitter.update(str)
	end

	def send_random(file) do
		FutureTweet.FileReader.get_strings_to_tweet(file) 
		|> send
	end
end