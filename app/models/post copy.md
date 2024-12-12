class Post < ApplicationRecord
  has_many :comments
  broadcasts_to ->(post) { :posts_list }

  # *** FOR INFORMATION PURPOSES BELOW ***
  # EQUAL TO BELOW
  after_create_commit { broadcast_append_to :posts_list }
  after_update_commit { broadcast_replace_to :posts_list }
  after_destroy_commit { broadcast_remove_to :posts_list }

  # WITHOUGHT MAGIC DOES BELOW [but to 'all-posts' instead of posts]
  after_create_commit do
    broadcast_update_to :posts_list, target: "posts_count", html: Post.count #EXTRA <==
    broadcast_append_to :posts_list, target: "posts", partial: "posts/post", locals: { post: self }
  end
  after_update_commit do
    broadcast_replace_to :posts_list, target: self, partial: "posts/post", locals: { post: self }
  end
  after_create_commit do
    broadcast_remove_to :posts_list, target: self
  end
end
