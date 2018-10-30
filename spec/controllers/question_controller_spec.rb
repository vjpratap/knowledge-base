require 'rails_helper'

RSpec.describe QuestionController, type: [:request, :controller] do

  describe "GET index" do

    let(:question) {create(:question)}
    it "assigns question" do
      first_question = question
      get '/question'
      expect(first_question.title).to eq(JSON.parse(response.body)[0]['title'])
    end

    it 'should add multiple ruby questions' do
      first_question = question
      get '/question'
      expect(first_question.title).to eq(JSON.parse(response.body)[0]['title'])
      expect(JSON.parse(response.body).length).to eq(1)
      create(:question, title: "This is second ruby question a ruby question")
      get '/question'
      expect("This is second ruby question a ruby question").to eq(JSON.parse(response.body)[1]['title'])
      expect(JSON.parse(response.body).length).to eq(2)
    end
  end
end
