class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :api_key
      t.boolean :blocked, default: false

      t.timestamps
    end
  end
end
