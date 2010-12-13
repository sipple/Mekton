class AddMechaModifiersToMecha < ActiveRecord::Migration
  def self.up
    add_column :mechas, :mv_bonus, :integer
    add_column :mechas, :ma_bonus, :integer
    add_column :mechas, :mp_bonus, :integer
  end

  def self.down
    remove_column :mechas, :mv_bonus
    remove_column :mechas, :ma_bonus
    remove_column :mechas, :mp_bonus
  end
end
