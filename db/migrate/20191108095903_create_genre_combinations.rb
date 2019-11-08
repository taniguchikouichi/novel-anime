class CreateGenreCombinations < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_combinations do |t|
      t.integer :genre_id
      t.integer :novel_id

      t.timestamps
    end
  end
end
