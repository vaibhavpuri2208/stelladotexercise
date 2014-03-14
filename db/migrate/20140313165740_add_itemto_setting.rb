class AddItemtoSetting < ActiveRecord::Migration
  def change
		add_column :settings, :items, :integer
  end
end
