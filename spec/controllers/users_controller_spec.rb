require 'rails_helper'
require 'pry'

RSpec.describe UsersController, type: :request do
  let(:new_user) {create(:user)}

  describe "POST #register" do
    it 'should register user' do
      params = {"user": {"name": "vijay", "email": "vijay@email.com", "password_digest": "123"}}
      post '/auth/register', params: params
      expect("User created successfully").to eq(JSON.parse(response.body)["message"])
    end
  end
end
