class AddUserNameNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:user, :name, false)
  end
end
