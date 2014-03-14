class AddPrioritytoSetting < ActiveRecord::Migration
  def change
		add_column :settings, :priority, :float
  end
end
