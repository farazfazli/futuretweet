defmodule FutureTweet.Scheduler do
	# Default to every minute and test txt file
	def schedule_file(schedule\\"30 0-23 * * *", file) do
		Quantum.add_job(schedule, fn -> 
			FutureTweet.FileReader.get_strings_to_tweet(file) 
			|> FutureTweet.TweetServer.tweet()
			end)
	end
end