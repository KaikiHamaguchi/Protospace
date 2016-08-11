  class Project < ActiveRecord::Base
    belongs_to :user
    has_many :thumbnails
    has_many :comments
    has_many :likes, dependent: :destroy
    accepts_nested_attributes_for :thumbnails

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
end
