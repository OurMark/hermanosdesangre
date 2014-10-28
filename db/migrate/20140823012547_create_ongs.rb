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
      t.string :twitter
      t.string :national_network
      t.string :international_network
      t.string :comments
      t.float :latitude
      t.float :longitude
      t.integer :ourmark_id
      t.integer :user_id

      t.timestamps
    end
  end
end
