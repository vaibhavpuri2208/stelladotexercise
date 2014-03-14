class AddFeaturetoSetting < ActiveRecord::Migration
  def change
		add_column :settings, :feature, :boolean, default:true 
  end
end
