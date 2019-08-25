class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true

  def self.search(search)
    return Post.all unless search
    Post.where("subject = '#{search}'")
  end
end
