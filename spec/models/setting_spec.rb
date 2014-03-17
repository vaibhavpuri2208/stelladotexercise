 require 'spec_helper'

describe Setting do
	it "has a valid factory" do
		expect(create(:setting)).to be_valid
	end

	it "items cannot be a float" do 
		expect(Setting.new(items:1.1)).to have(1).errors_on(:items)
	end

	it "items can be a integer" do 
		expect(create(:setting, user_id:232)).to be_valid
	end

	it "items cannot be greater than 5" do 
		expect(Setting.new(items:6)).to have(1).errors_on(:items)
	end

	it "items cannot be less than 1" do 
		expect(Setting.new(items:-1)).to have(1).errors_on(:items)
	end

	it "priority is a float" do 
		expect(Setting.new(priority:0.1)).to_not have(1).errors_on(:priority)
	end

	it "priority is valid if between 0 and 1" do 
		expect(create(:setting, priority:0.1)).to be_valid
		expect(create(:setting, priority:1.0, user_id:rand(100..500))).to be_valid
	end

	it "priority is not valid if greater than 1" do 
		setObject1 = create(:setting)
		setObject1.priority = 1.1
		expect(setObject1).to have(1).errors_on(:priority)
	end

	it "email cannot be nil" do 
		setObject1 = create(:setting)
		setObject1.email = nil
		expect(setObject1).to have(1).errors_on(:email)
	end

	it "cannot create multiple settings association for one user" do 
		setObject1 = create(:setting, user_id:100)
		expect(setObject1).to be_valid
		setObject2 = create(:setting, user_id:101)
		setObject1.user_id = setObject2.user_id
		expect(setObject1).to_not be_valid
	end

end