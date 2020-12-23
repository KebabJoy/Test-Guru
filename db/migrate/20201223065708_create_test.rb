class CreateTest < ActiveRecord::Migration[6.1]
  def change
    create_table :test do |t|
      t.string :title, null: false
      t.integer :level, default: 1
      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :user }

      t.timestamps
    end
  end
end
