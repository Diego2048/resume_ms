class CreateExperiences < ActiveRecord::Migration
  def self.up
    create_table :experiences do |t|
      t.references :user, :null => false, :index => true
      t.string :company
      t.string :industry
      t.string :department
      t.date :start_on
      t.date :end_on
      t.string :title
      t.text :summary
      t.timestamps
    end
  end

  def self.down
    drop_table :experiences
  end
end
