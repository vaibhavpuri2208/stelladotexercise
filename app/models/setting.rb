class Setting < ActiveRecord::Base
	validates  :email, presence:true
	validates_numericality_of :items, only_integer:true
	validates_numericality_of :priority 
	validates_inclusion_of :priority, :in => 0..1
	validates_inclusion_of :items, :in => 1..5
	validates_uniqueness_of :user_id, :message => "This users already has a settings page!"
	after_commit :delete_cache
	#validate :setting_exists?, on: :create


	def setting_exists? 
		user_ids = Setting.pluck :user_id
		errors.add(:user_id, "user has a settings file already") if user_ids.include? self.user_id
	end	

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
