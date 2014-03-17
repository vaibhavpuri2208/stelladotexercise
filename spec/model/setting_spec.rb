 require 'spec_helper'

describe Setting do
	it "has a valid factory" do
		expect(create(:setting)).to be_valid
	end

	it "items is cannot be a float" do 
		expect(build(:setting, items:1.1)).not_to be_valid
	end
end