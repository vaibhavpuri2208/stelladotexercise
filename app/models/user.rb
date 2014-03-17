class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_one :setting
	after_create :add_settings
	accepts_nested_attributes_for :setting

	def add_settings
		self.create_setting(email:self.email, items:3, priority:1.0, feature:true)
	end

end
