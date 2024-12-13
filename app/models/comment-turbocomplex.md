class Comment < ApplicationRecord
  belongs_to :post

  include ActionView::RecordIdentifier

  after_create_commit do
    broadcast_prepend_to :posts_list, target: dom_id(post, :comments), partial: "comments/comment", locals: { comment: self }
    broadcast_replace_to :posts_list, target: dom_id(post), partial: "posts/post", locals: { post: post }
  end

  after_update_commit do
    broadcast_replace_to :posts_list, target: dom_id(self), partial: "comments/comment", locals: { comment: self }
  end

  after_destroy_commit do
    broadcast_remove_to :posts_list, target: dom_id(self)
    broadcast_replace_to :posts_list, target: dom_id(post), partial: "posts/post", locals: { post: post }
  end
end
