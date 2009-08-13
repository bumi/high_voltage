class CreateHighVoltagePages < ActiveRecord::Migration
  def self.up
    create_table :high_voltage_pages do |t|
      t.string :title, :permalink
      t.text :body
    end
    add_index :high_voltage_pages, :permalink
  end
  
  def self.down
    drop_table :high_voltage_pages
  end
end
