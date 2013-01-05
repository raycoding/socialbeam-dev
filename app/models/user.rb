class User < ActiveRecord::Base
  include BCrypt
  include Scrubber
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  attr_accessor :password
  before_save :encrypt_password
  before_save :create_unique_profile_id
  before_save :create_beamer_id
  has_many :sent_messages,
  :class_name => 'Message',
  :primary_key=>'beamer_id',
  :foreign_key => 'sender_id',
  :order => "messages.created_at DESC",
  :conditions => ["messages.sender_deleted = ?", false]

  has_many :received_messages,
  :class_name => 'Message',
  :primary_key=>'beamer_id',
  :foreign_key => 'recepient_id',
  :order => "messages.created_at DESC",
  :conditions => ["messages.recepient_deleted = ?", false]


  validates_confirmation_of :password , :message => "Passwords donot match."
  validates_presence_of :password, :message => "Please Enter a Password"
  validates_presence_of :email,:message=>"Email ID Field cannot be blank"
  validates_uniqueness_of :email,:message => "Sorry this Email ID is already registered."
  validates_presence_of :first_name , :message => "First Name Field cannot be blank"
  validates_presence_of :last_name, :message => "Last Name Field cannot be blank"

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def create_beamer_id
    self.beamer_id=gen_beamer_id
  end

  def create_unique_profile_id
    self.profile_id=gen_profile_id
  end


  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def unread_messages?
    unread_message_count > 0 ? true : false
  end

  # Returns the number of unread messages for this user
  def unread_message_count
    eval 'messages.count(:conditions => ["recepient_id = ? AND read_at IS NULL", self.beamer_id])'
  end      
end
