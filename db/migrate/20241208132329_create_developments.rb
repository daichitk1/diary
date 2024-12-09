class CreateDevelopments < ActiveRecord::Migration[7.2]
  def change
    create_table :developments do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
