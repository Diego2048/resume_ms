class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.references :user, null: false, index: true
      t.string :name
      t.date :begin_on
      t.date :end_on
      t.text :summary
      t.text :duty
      t.text :platform
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
