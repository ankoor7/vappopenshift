class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.string :location
      t.string :phone
      t.string :email
      t.text :description
      t.string :website

      t.timestamps
    end
  end
end
