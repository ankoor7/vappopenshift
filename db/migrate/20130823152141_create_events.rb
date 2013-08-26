class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :group
      t.string :name
      t.string :location
      t.integer :number_volunteers
      t.datetime :date
      t.text :description
      t.text :special_instructions

      t.timestamps
    end
  end
end
