class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :user_id, null:false
      t.integer :shortened_url_id, null:false
      t.timestamps
    end
    add_index :visits, :user_id, unique:true
  end
end
