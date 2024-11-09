class AddDatatimeToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :start_time, :datetime
  end
end
