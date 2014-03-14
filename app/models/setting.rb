class Setting < ActiveRecord::Base
	validates  :email, presence:true
	validates_numericality_of :items, only_integer:true
	validates_numericality_of :priority
	after_commit :delete_cache



 def initialize(params={})
   super(params)
  end

	def self.cached_object id
		Rails.cache.fetch([name, id]) {find(id)}
	end

	def delete_cache
		Rails.cache.delete([self.class.name, id])
	end

end
