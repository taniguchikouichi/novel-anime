class CreateNovels < ActiveRecord::Migration[5.2]
  def change
    create_table :novels do |t|
      t.integer :genre_id 
      t.integer :label_id
      t.integer :story_id 
      t.integer :production_id
      t.integer :setting_id
      t.integer :person_id
      t.string :title
      t.string :explanation

      t.timestamps
    end
  end
end
