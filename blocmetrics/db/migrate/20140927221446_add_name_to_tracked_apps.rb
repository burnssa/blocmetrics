class AddNameToTrackedApps < ActiveRecord::Migration
  def change
  	add_column :tracked_apps, :name, :string
  	add_column :tracked_apps, :desc, :text
  end
end
