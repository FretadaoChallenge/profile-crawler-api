class AddTwitterUsernameToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :twitter_username, :string
  end
end
