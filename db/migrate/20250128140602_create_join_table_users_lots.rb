class CreateJoinTableUsersLots < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :lots do |t|
      t.index [:user_id, :lot_id]
      t.index [:lot_id, :user_id]
    end
  end
end
