class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :email
      t.string :visitor_ip
      t.integer :ended_at

      t.timestamps
    end
  end
end
