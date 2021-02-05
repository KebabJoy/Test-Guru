class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 1
      t.references :category, null: false, foreign_key: true
      

      t.timestamps
    end
    add_foreign_key :tests, :users, column: :id
  end
end
