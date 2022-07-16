# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "#visible?" do
    it "returns true" do
      comment = Comment.new
      expect(comment.visible?).to eq(true)
    end
  end
end
