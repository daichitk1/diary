json.extract! one_diary, :id, :title, :content, :date, :created_at, :updated_at
json.url one_diary_url(one_diary, format: :json)
