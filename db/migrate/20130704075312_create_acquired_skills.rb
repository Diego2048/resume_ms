class CreateAcquiredSkills < ActiveRecord::Migration
  def self.up
    create_table :acquired_skills do |t|
      t.references :user, null: false, index: true
      t.references :skill, null: false, index: true
      t.integer :experience, limit: 2
      t.integer :level, limit: 1
    end
  end

  def self.down
    drop_table :acquired_skills
  end
end
