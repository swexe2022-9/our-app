class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :thread_id
      t.text :comment
      t.timestamps
      t.index :thread_id
    end
  end
end
