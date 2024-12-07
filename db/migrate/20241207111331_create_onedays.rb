class CreateOnedays < ActiveRecord::Migration[7.2]
  def change
    create_table :onedays do |t|
      t.timestamps
    end
  end
end
