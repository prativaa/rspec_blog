require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      post = FactoryBot.create(:post)
      get :show, params: { id: post.id }
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new post" do
        expect {
          post :create, params: { post: FactoryBot.attributes_for(:post) }
        }.to change(Post, :count).by(1)
      end

      it "redirects to root_path" do
        post :create, params: { post: FactoryBot.attributes_for(:post) }
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid attributes" do
      it "doesn't create a new post" do
        expect {
          post :create, params: { post: FactoryBot.attributes_for(:invalid_post) }
      }.to change(Post, :count).by(0)
      end

      it "renders the new template" do
        post :create, params: { post: FactoryBot.attributes_for(:invalid_post) }
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    it "renders the edit templated" do
      post = FactoryBot.create(:post)
      get :edit, params: { id: post.id }
      expect(response).to render_template :edit
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "updates the post" do
        post = FactoryBot.create(:post)
        put :update, params: { id: post.id, 
                                  post: FactoryBot.attributes_for(:post, 
                                  title: "Updated Title",
                                  author: "Larry") }
        post.reload
        expect(post.title).to eq("Updated Title")
        expect(post.author).to eq("Larry")
      end

      it "redirects to root_path" do
        post = FactoryBot.create(:post)
        put :update, params: { id: post.id, 
                                  post: FactoryBot.attributes_for(:post, 
                                  title: "Updated Title",
                                  author: "Larry") }
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid attributes" do
      it "doesn't update the post" do
        post = FactoryBot.create(:post)
        put :update, params: { id: post.id, 
                                  post: FactoryBot.attributes_for(:post, 
                                  title: "Updated Title",
                                  author: "Larry",
                                  content: "test") }
        post.reload
        expect(post.title).to_not eq("Updated Title")
        expect(post.author).to_not eq("Larry")
      end

      it "renders the edit template" do
        post = FactoryBot.create(:post)
        put :update, params: { id: post.id, 
                                  post: FactoryBot.attributes_for(:post, 
                                  title: "Updated Title",
                                  author: "Larry",
                                  content: "test") }
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the post" do
      post = FactoryBot.create(:post)
      expect {
        delete :destroy, params: { id: post.id }
      }.to change(Post, :count).by(-1)
    end

    it "redirects to root_path" do
      post = FactoryBot.create(:post)
      delete :destroy, params: { id: post.id }
      expect(response).to redirect_to root_path
    end
  end
end
