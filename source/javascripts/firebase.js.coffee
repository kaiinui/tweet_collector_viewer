isNew = false # Hack to retrieve only newer tweets.

tweets = new Firebase('https://tweet-collect.firebaseio.com/tweets');
tweets.on 'child_added', (tweet)->
  return unless isNew
  text = tweet.val().text
  user_id = tweet.val().user_id
  $("._tweets").prepend $("<li />").text(text).prepend($("<strong />").text("@#{user_id}"))
  $("._tweets").find("li").eq(20).remove()
tweets.once 'value', (tweet)->
  $("._load").remove()
  isNew = true