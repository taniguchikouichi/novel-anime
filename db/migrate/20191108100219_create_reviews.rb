class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :novel_id
      t.string :title
      t.string :text
      t.float :evaluation

      t.timestamps
    end
  end
end
