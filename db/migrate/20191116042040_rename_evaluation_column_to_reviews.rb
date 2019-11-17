class RenameEvaluationColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :evaluation, :rate
  end
end
