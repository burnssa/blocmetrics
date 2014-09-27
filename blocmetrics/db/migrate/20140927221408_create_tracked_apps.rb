class CreateTrackedApps < ActiveRecord::Migration
  def change
    create_table :tracked_apps do |t|

      t.timestamps
    end
  end
end
