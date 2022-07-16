# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/comments", type: :request do
  let(:target_post) do
    Post.create!(title: "Title", content: "MyText")
  end

  let(:valid_attributes) do
    { username: "Username", post_id: target_post.id, content: "Content" }
  end

  let(:invalid_attributes) do
    { username: "a" * 11, post_id: target_post.id, content: "Content" }
  end

  describe "GET /index" do
    it "renders a successful response" do
      Comment.create! valid_attributes
      get comments_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      comment = Comment.create! valid_attributes
      get comment_url(comment)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_comment_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      comment = Comment.create! valid_attributes
      get edit_comment_url(comment)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Comment" do
        expect {
          post comments_url, params: { comment: valid_attributes }
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the created comment" do
        post comments_url, params: { comment: valid_attributes }
        expect(response).to redirect_to(comment_url(Comment.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Comment" do
        expect {
          post comments_url, params: { comment: invalid_attributes }
        }.to change(Comment, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post comments_url, params: { comment: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        { content: "Updated comment" }
      end

      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        patch comment_url(comment), params: { comment: new_attributes }
        comment.reload
      end

      it "redirects to the comment" do
        comment = Comment.create! valid_attributes
        patch comment_url(comment), params: { comment: new_attributes }
        comment.reload
        expect(response).to redirect_to(comment_url(comment))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        comment = Comment.create! valid_attributes
        patch comment_url(comment), params: { comment: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete comment_url(comment)
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      comment = Comment.create! valid_attributes
      delete comment_url(comment)
      expect(response).to redirect_to(comments_url)
    end
  end
end
