class AddEncryptedPasswordToUser < ActiveRecord::Migration
  def change
    add_column :user, :remember_created_at, :datetime
  end
end
