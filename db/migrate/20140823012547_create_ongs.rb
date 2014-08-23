class CreateOngs < ActiveRecord::Migration
  def change
    create_table :ongs do |t|
      t.string :name
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip
      t.string :country
      t.string :phone
      t.string :email
      t.string :website
      t.string :facebook
      t.string :national_network
      t.string :international_network
      t.string :comments

      t.timestamps
    end
  end
end
