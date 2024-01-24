class CreateWritings < ActiveRecord::Migration[7.1]
  def change
    create_table :writings do |t|
      t.string :title
      t.string :body
      t.string :author
      t.integer :under

      t.timestamps
    end
  end
end
