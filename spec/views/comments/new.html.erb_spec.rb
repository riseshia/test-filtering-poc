# frozen_string_literal: true

require "rails_helper"

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      username: "MyString",
      post: nil,
      content: "MyString"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do
      assert_select "input[name=?]", "comment[username]"

      assert_select "input[name=?]", "comment[post_id]"

      assert_select "input[name=?]", "comment[content]"
    end
  end
end
