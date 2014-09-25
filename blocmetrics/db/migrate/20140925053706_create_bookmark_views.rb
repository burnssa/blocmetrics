class CreateBookmarkViews < ActiveRecord::Migration
  def change
    create_table :bookmark_views do |t|
      t.string :url

      t.timestamps
    end
  end
end
