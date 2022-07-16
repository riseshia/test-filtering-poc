# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Viewing post", type: :system, js: true do
  before do
    driven_by :selenium, using: :headless_chrome

    Post.create!(
      title: "No1 post!",
      content: "MyText"
    )
  end

  it "access to recent post" do
    visit "/posts"

    click_on "Show this post"

    expect(page).to have_text("Title:\nNo1 post!")
  end
end
