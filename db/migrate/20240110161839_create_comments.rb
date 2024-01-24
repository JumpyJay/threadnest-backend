class CreateComments < ActiveRecord::Migration[7.1]
  def change
    drop_table :comments, if_exists: true
    
    create_table :comments do |t|
      t.string :body
      t.integer :under

      t.timestamps
    end
  end
end
