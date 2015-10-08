class AddResetPasswordTokenToUsers < ActiveRecord::Migration
  def change
    add_column :user, :reset_password_token, :string
  end
end
