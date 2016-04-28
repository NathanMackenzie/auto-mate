class AddUserToFacebook < ActiveRecord::Migration
  def change
    add_reference :facebooks, :user, index: true, foreign_key: true
  end
end
