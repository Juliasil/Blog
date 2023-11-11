class Comment < ApplicationRecord
  validates :author, :body, presence: true
  belongs_to :blog_post, class_name: "BlogPost"
end
