class Post < ApplicationRecord
    enum status: { unprocessed: 0, in_progress: 1, completed: 2 }
end
