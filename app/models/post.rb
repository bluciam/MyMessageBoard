class Post < ActiveRecord::Base
  belongs_to :user
  has_many :replies
  validates :title, :content, presence: true
end
