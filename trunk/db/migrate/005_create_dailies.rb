class CreateDailies < ActiveRecord::Migration
  def self.up
    create_table :dailies do |t|
      t.datetime :date
      t.decimal :total
      t.decimal :foodcost
      t.decimal :hours
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :dailies
  end
end
