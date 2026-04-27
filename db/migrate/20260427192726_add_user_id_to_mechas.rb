class AddUserIdToMechas < ActiveRecord::Migration[8.1]
  def change
    add_reference :mechas, :user, null: false, foreign_key: true
  end
end
