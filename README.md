# FutureTweet
Send tweets in the future from a text file, with CRON-like syntax. From CRON format help, check https://crontab.guru/

## Getting Started

1. 
  Create a Twitter app and set the following env variables:
    ```
      TWITTER_CONSUMER_KEY
      TWITTER_CONSUMER_SECRET
      TWITTER_ACCESS_KEY
      TWITTER_ACCESS_SECRET
    ```

  2.
    Get dependencies
    
        mix deps.get



  3.
    Run server
    ```
      iex -S mix 
    ```

To edit tweets simply edit [priv/tweets.txt](https://github.com/farazfazli/futuretweet/blob/master/priv/tweets.txt) and replace it with a newline separated list of tweets. They are tweeted out randomly from this file.
