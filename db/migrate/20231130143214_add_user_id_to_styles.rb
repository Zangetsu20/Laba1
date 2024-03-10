class AddUserIdToStyles < ActiveRecord::Migration[7.1]
  def change
    add_reference :styles, :user, null: false, foreign_key: true
  end
end
