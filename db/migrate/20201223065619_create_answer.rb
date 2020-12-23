class CreateAnswer < ActiveRecord::Migration[6.1]
  def change
    create_table :answer do |t|
      t.string :title, null:false
      t.boolean :correct, null:false, default: false
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
