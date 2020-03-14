class RemoveUniquenessFromVisits < ActiveRecord::Migration[5.2]
  def change
   
    remove_index :visits, :user_id
    add_index :visits, :user_id
  end
end
