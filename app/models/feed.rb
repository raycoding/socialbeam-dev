class Feed < ActiveRecord::Base
  belongs_to :feed_item
  belongs_to :profile
  attr_immutable :id, :profile_id, :feed_item_id
end