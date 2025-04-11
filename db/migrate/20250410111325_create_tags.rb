class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.integer :color, null: false, default: 16777215 # Default to white color (0xFFFFFF)

      t.timestamps
    end
  end
end
