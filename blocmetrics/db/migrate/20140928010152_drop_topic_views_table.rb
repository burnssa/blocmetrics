class DropTopicViewsTable < ActiveRecord::Migration
  def change
  	drop_table :topic_views
  	drop_table :visits
  end
end
