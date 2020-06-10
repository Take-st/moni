require './get_screen_shot'
require './post_to_slack'

GetScreenShot.new.execute
PostToSlack.new.execute("./screenshot.png")
