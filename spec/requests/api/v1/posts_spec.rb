require 'rails_helper'

RSpec.describe "Api::V1::Posts", type: :request do
  describe "PostAPI" do
    it "すべてのポストを取得する" do
      FactoryBot.create_list(:post, 10)
      get '/api/v1/posts'
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json['data'].length).to eq(10)

    end
  end

  describe "PostAPI" do
    it '特定のpostを取得する' do
      post = FactoryBot.create(:post, title: 'test-title')
      get "/api/v1/posts/#{post.id}"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data']['title']).to eq(post.title)
    end
  end
end
