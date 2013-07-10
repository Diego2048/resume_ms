class ChangeDegreeForUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.change :degree, :integer, :limit => 1
    end
  end

  def self.down
    change_table :users do |t|
      t.change :degree, :string
    end
  end
end
