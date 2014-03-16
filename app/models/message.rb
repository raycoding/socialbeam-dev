class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => "Profile"
  belongs_to :receiver, :class_name => "Profile"
  validates_presence_of :body, :subject, :sender, :receiver
 
  def unread?
    !read
  end
end
