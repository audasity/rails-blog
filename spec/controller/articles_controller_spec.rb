# frozen_string_literal: true

require 'rails_helper'

describe ArticlesController, type: :controller do
    let(:current_user) { create(:user, id: 1) }

    before do
        current_user
    end

  describe '#index' do
    context 'for loggedin user' do

      before do
        allow(@controller).to receive(:current_user).and_return(current_user)
      end

      it 'has 200 status code' do
        get :index
        expect(response.status).to eq(200)
      end

      it 'has current_user_articles' do
        build_stubbed(:article, user_id: current_user.id)
        get :index
        current_user_articles = assigns(:current_user_articles)
        expect(current_user_articles).not_to be_nil
      end

      it 'has public_articles' do
        create(:article, user_id: current_user.id)
        create(:article)
        get :index
        public_articles = assigns(:public_articles)
        expect(public_articles.count).to eq(2)
      end
    end

    context 'for guest user' do
      before do
        create(:article)
        create(:article)
      end

      it 'has 200 status code' do
        get :index
        expect(response.status).to eq(200)
      end

      it 'has no current_user_articles' do
        create(:article)
        get :index
        current_user_articles = assigns(:current_user_articles)
        expect(current_user_articles).to be_nil
      end

      it 'has public articles' do
        get :index
        public_articles = assigns(:public_articles)
        expect(public_articles.count).to eq(2)
      end
    end
  end

  describe '#show' do
    context 'for loggedin user' do
      

      before do
        allow(@controller).to receive(:current_user).and_return(current_user)
      end

      it 'has 200 status code' do
        article1 = create(:article)
        get :show, params: { id: article1.id }
        expect(response.status).to eq(200)
      end

      it 'can see own private article' do
        create(:article, status: 'private', id: 10, user_id: current_user.id)
        get :show, params: { id: 10 }
        expect(response.status).to eq(200)
      end
    end

    context 'for guest user' do
      it 'has 200 status code' do
        article1 = create(:article)
        get :show, params: { id: article1.id }
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#create' do
    context 'for loggedin user' do
      

      before do
        allow(@controller).to receive(:authenticate_user!).and_return(true)
        allow(@controller).to receive(:current_user).and_return(current_user)
      end

      it 'redict to signin' do
        attributes = { article: FactoryBot.attributes_for(:article)}
        post :create, params: attributes
        expect(response).to be_redirect
        expect(Article.first).to be_present
        expect(Article.first.title).to eq('Title')
      end
    end

    context 'for guest user' do
      xit 'redict to signin' do
        post :create, params: attributes
        expect(response).to be_redirect
      end
    end
  end
end
