class DropUserTests < ActiveRecord::Migration[6.1]
  def up
    drop_table :user_tests
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
