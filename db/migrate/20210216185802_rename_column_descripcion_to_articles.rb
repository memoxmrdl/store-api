class RenameColumnDescripcionToArticles < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :descripcion, :description
  end
end
