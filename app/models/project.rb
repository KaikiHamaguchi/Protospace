class Project < ActiveRecord::Base
    project belongs_to :user
    project has_many :comments
    project has_many :project_Images
    project has_many :likes

    validates :user_id
end
