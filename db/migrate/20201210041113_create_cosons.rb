class CreateCosons < ActiveRecord::Migration[6.0]
  def change
    create_table :cosons do |t|
      t.string :title,               null: false
      t.text   :info
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
