class Post < ApplicationRecord
    enum status: { unprocessed: 0, in_progress: 1, completed: 2 }
    enum important_status: { normal: 0, important: 1, every_day: 2 }
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    # 投稿内容からハッシュタグを抽出・保存するメソッド
    after_save :extract_and_save_tags

    private

    def extract_and_save_tags
        # 投稿内容からハッシュタグを抽出（#付きの単語）
        extracted_tags = tag_content.scan(/#\w+/).map { |tag| tag.downcase.delete('#') }.uniq

        # 抽出したハッシュタグを保存
        extracted_tags.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name)
        tags << tag unless tags.include?(tag)
        end
    end
end
