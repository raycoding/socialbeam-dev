class Scribble < ActiveRecord::Base
  attr_accessible :post, :posted_by, :posted_by_uid
end
