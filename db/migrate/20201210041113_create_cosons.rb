class CreateCosons < ActiveRecord::Migration[6.0]
  def change
    create_table :cosons do |t|
      t.string :title,               null: false
      t.text   :info,                null: false
      t.string :url,                 null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
