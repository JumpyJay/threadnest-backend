class AddAuthorToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :author, :string
  end
end
