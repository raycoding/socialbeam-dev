class Newsfeed < ActiveRecord::Base

  attr_accessible :verb, :activity, :actor_id, :actor_type, :actor_name_method,:indirect_actor_id,:indirect_actor_type,:indirect_actor_name_method,:object_id,:object_type,:object_name_method,:privacystatus
	
	def log(verb,activity,actor,actor_type,actor_name,indirect_actor,indirect_actor_type,indirect_actor_name,object,object_name,privacy)
		self.verb = verb.to_s
		self.activity = activity.to_s
		self.actor_id = actor.to_s
		self.actor_type=actor_type.to_s
		self.actor_name_method = actor_name
		self.indirect_actor_id = indirect_actor.to_s
		self.indirect_actor_type=indirect_actor_type.to_s
		self.indirect_actor_name_method = indirect_actor_name.to_s
		self.object_id = object.to_s
		self.object_type = object.class.to_s
		self.object_name_method = object_name.to_s
		self.privacystatus = privacystatus
	end

end
