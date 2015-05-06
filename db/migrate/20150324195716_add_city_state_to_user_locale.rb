class AddCityStateToUserLocale < ActiveRecord::Migration
  def change
    add_column :user_locale, :city, :string
    add_column :user_locale, :state, :string
  end
end
