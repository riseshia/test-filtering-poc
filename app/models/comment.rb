# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post

  validates :username, presence: true
  validates :username, length: { maximum: 10 }
  validates :content, presence: true
end
