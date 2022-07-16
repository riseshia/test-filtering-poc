# frozen_string_literal: true

require "rails_helper"

RSpec.describe "comments/show", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      username: "Username",
      post: Post.create!(
        title: "Title",
        content: "MyText"
      ),
      content: "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Content/)
  end
end
