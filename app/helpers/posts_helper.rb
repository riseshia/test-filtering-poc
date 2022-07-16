# frozen_string_literal: true

module PostsHelper
  def format_title(post)
    post.title.capitalize
  end
end
