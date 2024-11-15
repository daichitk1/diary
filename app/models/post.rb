class Post < ApplicationRecord
    enum status: { unprocessed: 0, in_progress: 1, completed: 2 }
    enum important_status: { normal: 0, important: 1, every_day: 2 }
end
