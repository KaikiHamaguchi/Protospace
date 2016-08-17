class Project < ActiveRecord::Base
    belongs_to :user
    has_many :thumbnails
    has_many :comments
    has_many :likes, dependent: :destroy
    accepts_nested_attributes_for :thumbnails

    validates :title, presence: true
    validates :catch_copy, presence: true
    validates :concept, presence: true

    acts_as_taggable

  def like_user(user)
   likes.find_by(user_id: user_id)
  end
end
