class Comment < ApplicationRecord
  belongs_to :post
  broadcasts_to :post
  #
  # # broadcasts_to ->(comment) {
  # #   [comment.post, :comments]
  # # }, inserts_by: :replace
  #
  # after_commit -> { broadcast_replace_to [post, :comments] }

end
