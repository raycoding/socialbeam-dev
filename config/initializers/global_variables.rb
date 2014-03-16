DELETE_CONFIRM = "Are you sure you want to delete?\nThis can not be undone."
SEARCH_LIMIT = 25
SITE_NAME = 'Doozy'
SITE = Rails.env == 'production' ? 'doozy.com' : 'localhost:3000'
MAILER_TO_ADDRESS = "doozyservice@#{SITE}"
MAILER_FROM_ADDRESS = "Doozy Service <doozyservice@#{SITE}>"
REGISTRATION_RECIPIENTS = %W() #send an email to this list everytime someone signs up