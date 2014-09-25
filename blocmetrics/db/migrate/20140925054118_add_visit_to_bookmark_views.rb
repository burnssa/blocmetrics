class AddVisitToBookmarkViews < ActiveRecord::Migration
  def change
    add_column :bookmark_views, :visit, :integer
    add_index :bookmark_views, :visit
  end
end
