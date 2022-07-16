# frozen_string_literal: true

require "rails_helper"

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        username: "Username",
        post: Post.create!(
          title: "Title",
          content: "MyText"
        ),
        content: "Content"
      ),
      Comment.create!(
        username: "Username",
        post: Post.create!(
          title: "Title",
          content: "MyText"
        ),
        content: "Content"
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "p>span", text: "Username".to_s, count: 2
    assert_select "p>span", text: "Content".to_s, count: 2
  end
end
