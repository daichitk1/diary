class AddTagContentToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :tag_content, :string
  end
end
