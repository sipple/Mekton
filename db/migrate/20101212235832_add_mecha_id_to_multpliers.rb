class AddMechaIdToMultpliers < ActiveRecord::Migration
  def self.up
    add_column :mecha_multipliers, :mecha_id, :integer
  end

  def self.down
    remove_column :mecha_multipliers, :mecha_id
  end
end
