class ChangeBeginOnForExperiences < ActiveRecord::Migration
  def self.up
    rename_column :experiences, :start_on, :begin_on
  end

  def self.down
    rename_column :experiences, :begin_on, :start_on
  end
end
