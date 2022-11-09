class CreateThres < ActiveRecord::Migration[5.2]
  def change
    create_table :thres do |t|
      t.string :title
      t.binary :image
      t.integer :user_id

      t.timestamps
    end
  end
end
