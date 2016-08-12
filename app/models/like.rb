class Like < ActiveRecord::Base
  belongs_to :project, counter_cache: :likes_count
  belongs_to :user
end
