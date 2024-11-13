class CreateOneDiaries < ActiveRecord::Migration[7.2]
  def change
    create_table :one_diaries do |t|
      t.string :title
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
