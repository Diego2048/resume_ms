class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.boolean :gender
      t.date :birth_on
      t.date :work_on
      t.string :degree

      t.string :email
      t.string :phone
      t.string :qq
      t.string :msn

      t.string :city
      t.string :address
      t.string :hukou
      t.string :family_tel

      t.string :company
      t.string :title
      t.string :industry
      t.string :website
      t.text :self_intro

      t.text :contact_records
      t.integer :score, :limit => 1
      t.string :source
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
