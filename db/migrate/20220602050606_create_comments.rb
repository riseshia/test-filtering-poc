class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :username, null: false
      t.references :post, null: false, foreign_key: true
      t.string :content, null: false

      t.timestamps
    end
  end
end
