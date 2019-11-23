class CreateNovels < ActiveRecord::Migration[5.2]
  def change
    create_table :novels do |t|
      t.integer :label_id
      t.string :title
      t.string :explanation

      t.timestamps
    end
  end
end
