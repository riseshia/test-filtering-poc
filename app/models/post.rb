# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 30 }
  validates :content, presence: true
end
