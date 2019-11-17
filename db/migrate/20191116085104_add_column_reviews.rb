class AddColumnReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :production_rate, :float
    add_column :reviews, :setting_rate, :float
    add_column :reviews, :person_rate, :float

  end
end
