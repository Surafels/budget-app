class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :amount
      t.datetime :created_at
      t.references :authorId, null: false, foreign_key: true

      t.timestamps
    end
  end
end
