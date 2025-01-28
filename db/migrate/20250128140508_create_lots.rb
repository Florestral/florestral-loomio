class CreateLots < ActiveRecord::Migration[7.0]
  def change
    create_table :lots do |t|
      t.string :title
      t.string :location
      t.integer :size
      t.text :description

      t.timestamps
    end
  end
end
