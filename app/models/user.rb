class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :comments
  has_many :likes

  accepts_nested_attributes_for :projects

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { maximum: 8 }

end
