# frozen_string_literal: true

require "rails_helper"

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        title: "Title",
        content: "MyText"
      ),
      Post.create!(
        title: "Title",
        content: "MyText"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "p>span", text: "Title".to_s, count: 2
    assert_select "p>span", text: "MyText".to_s, count: 2
  end
end
