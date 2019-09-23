class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :twitter_profile_address

      t.timestamps
    end
  end
end
