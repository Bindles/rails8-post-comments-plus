class Comment < ApplicationRecord
  belongs_to :post

  # Include RecordIdentifier for `dom_id`
  include ActionView::RecordIdentifier

  # Broadcast changes to the global :posts_list stream
  after_create_commit do
    broadcast_prepend_to(:posts_list, target: dom_id(post, :comments), partial: "comments/comment", locals: { comment: self })
  end

  after_update_commit do
    broadcast_replace_to(:posts_list, target: dom_id(self), partial: "comments/comment", locals: { comment: self })
  end

  after_destroy_commit do
    broadcast_remove_to(:posts_list, target: dom_id(self))
  end
end
