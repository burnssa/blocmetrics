class CreateTopicViews < ActiveRecord::Migration
  def change
    create_table :topic_views do |t|
      t.string :topic_title
      
      t.timestamps
    end
  end
end
