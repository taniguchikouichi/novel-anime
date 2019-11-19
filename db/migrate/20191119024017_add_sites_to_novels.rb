class AddSitesToNovels < ActiveRecord::Migration[5.2]
  def change
    add_column :novels, :url, :string
  end
end
