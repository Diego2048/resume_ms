class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t|
      t.references :user, :null => false, :index => true
      t.string :school
      t.date :begin_on
      t.date :end_on
      t.string :degree
      t.string :major
      t.string :summary
      t.timestamps
    end
  end

  def self.down
    drop_table :educations
  end
end
