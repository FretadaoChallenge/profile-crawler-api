class AddShortenedUrlToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :shortened_url, :string
  end
end
