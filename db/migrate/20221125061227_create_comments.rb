class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :thre_id
      t.text :comment
      t.timestamps
      t.index :thre_id
      t.integer :user_id
      t.string :uidentifer
    end
  end
end
