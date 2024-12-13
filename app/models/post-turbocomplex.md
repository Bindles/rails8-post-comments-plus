class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  include ActionView::RecordIdentifier

  after_create_commit do
    update_posts_count
    broadcast_append_to :posts_list, target: "posts", partial: "posts/post", locals: { post: self }
  end

  after_update_commit do
    broadcast_replace_to :posts_list, target: dom_id(self), partial: "posts/post", locals: { post: self }
  end

  after_destroy_commit do
    update_posts_count
    broadcast_remove_to :posts_list, target: dom_id(self)
  end

  def update_posts_count
    broadcast_update_to :posts_list, target: "posts_count", html: Post.count
  end
end
