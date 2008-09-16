class AddJoinTableToProduct < ActiveRecord::Migration
  def self.up
    create_table :entries, :force => true do |t|
      t.column :daily_id, :integer
      t.column :product_id, :integer
      t.column :quantity, :integer
      t.column :price,  :decimal
    end
  end

  def self.down
    drop_table :entries
  end
end
