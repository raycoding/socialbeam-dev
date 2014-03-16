class FeedItem < ActiveRecord::Base  
  belongs_to :item, :polymorphic => true
  has_many :feeds
  attr_immutable :id, :item_id, :item_type
  
  def partial
    item.class.name.underscore
  end
end