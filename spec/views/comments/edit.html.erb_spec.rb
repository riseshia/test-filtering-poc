# frozen_string_literal: true

require "rails_helper"

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      username: "MyString",
      post: Post.create!(
        title: "Title",
        content: "MyText"
      ),
      content: "MyString"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
      assert_select "input[name=?]", "comment[username]"

      assert_select "input[name=?]", "comment[post_id]"

      assert_select "input[name=?]", "comment[content]"
    end
  end
end
