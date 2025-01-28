class AddLotToStances < ActiveRecord::Migration[7.0]
  def change
    add_reference :stances, :lot, foreign_key: true, null: true
  end
end
