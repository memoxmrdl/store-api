class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.text :name
      t.text :descripcion
      t.bigint :amount_cents, default: 0

      t.timestamps
    end
  end
end
