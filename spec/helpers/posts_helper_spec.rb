# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostsHelper, type: :helper do
  describe "#format_title" do
    it "capitalizes the first letter of the title" do
      post = Post.new(title: "title")
      expect(helper.format_title(post)).to eq("Title")
    end
  end
end
