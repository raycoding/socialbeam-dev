require 'digest/sha1' 
require 'mime/types'
class User < ActiveRecord::Base
  acts_as_authentic do|conf|
    conf.login_field = :email
  end
  attr_accessible :email, :password, :password_confirmation, :login
  attr_protected :is_admin, :can_send_messages
  validates_presence_of :login
  validates_length_of :login, :within => 3..40
  validates_uniqueness_of :login, :case_sensitive => false

  has_one :profile, :dependent => :nullify
  after_create :set_profile
  after_destroy :update_profile

  delegate :full_name, :to=>:profile

  #Authentications
  validate do |user|
    if user.new_record? #adds validation if it is a new record
      user.errors.add(:password, "is required") if user.password.blank?
      user.errors.add(:password_confirmation, "is required") if user.password_confirmation.blank?
      user.errors.add(:password, "Password and confirmation must match") if user.password != user.password_confirmation
    elsif !(!user.new_record? && user.password.blank? && user.password_confirmation.blank?) #adds validation only if password or password_confirmation are modified
      user.errors.add(:password, "is required") if user.password.blank?
      user.errors.add(:password_confirmation, "is required") if user.password_confirmation.blank?
      user.errors.add(:password, " and confirmation must match.") if user.password != user.password_confirmation
      user.errors.add(:password, " and confirmation should be atleast 4 characters long.") if user.password.length < 4 || user.password_confirmation.length < 4
    end
  end

  def set_profile
    p = Profile.find_or_create_by_email self.email
    raise 'User found when should be nil' unless p.user.blank?
    p.is_active=true
    p.user_id = id
    p.save
  end
  
  def update_profile
    profile.update_attributes :is_active=>false
  end

  def f
    profile.f
  end

  def can_mail? user
    can_send_messages? && profile.is_active?
  end
end