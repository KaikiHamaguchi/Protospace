class Project < ActiveRecord::Base
    belongs_to :user
    has_many :thumbnails
    has_many :comments
    accepts_nested_attributes_for :thumbnails

end
