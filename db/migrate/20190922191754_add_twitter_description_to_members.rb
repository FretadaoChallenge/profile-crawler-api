class AddTwitterDescriptionToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :twitter_description, :string
  end
end
