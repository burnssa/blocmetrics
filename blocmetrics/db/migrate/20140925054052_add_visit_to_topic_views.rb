class AddVisitToTopicViews < ActiveRecord::Migration
  def change
    add_column :topic_views, :visit, :integer
    add_index :topic_views, :visit
  end
end
