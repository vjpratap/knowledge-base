require 'rails_helper'

RSpec.describe QuestionController, type: :request do

  let(:question) {create(:question)}
  describe "GET index" do

    it 'should fetch quetions' do
      new_question = question
      get '/question'
      expect(new_question.title).to eq(JSON.parse(response.body)[0]['title'])
    end

    it 'should fetch multiple question' do
      new_question = question
      get '/question'
      expect(new_question.title).to eq(JSON.parse(response.body)[0]['title'])
      expect(JSON.parse(response.body).length).to eq(1)
      create(:question, title: "This is second ruby question a ruby question")
      get '/question'
      expect("This is second ruby question a ruby question").to eq(JSON.parse(response.body)[1]['title'])
      expect(JSON.parse(response.body).length).to eq(2)
    end
  end

    describe "GET #show" do

      it 'should show question by id' do
        new_question = question
        get "/question/#{new_question.id}"
        expect(new_question.title).to eq(JSON.parse(response.body)['title'])
      end
    end

    describe "GET #new" do
      it 'should add a new question' do
        new_question = question
        Question.should_receive(:new).and_return(new_question)
        get "/question/new"
        expect(new_question.title).to eq(JSON.parse(response.body)['title'])
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new contact in the database" do
          params = {"question": {"title": "this is a question", "description": "this is description", "upvote": 5, "downvote": 2}}
          post '/question', params: params
          expect(5).to eq(JSON.parse(response.body)["upvote"])
          expect("this is a question").to eq(JSON.parse(response.body)["title"])
          expect("this is description").to eq(JSON.parse(response.body)["description"])
        end
      end
      context "with invalid attributes" do
        it "does not save the new contact in the database" do
          params = {"question": {"title": nil, "description": "this is description", "upvote": nil, "downvote": 2}}
          post '/question', params: params
          expect(422).to eq(response.status)
        end
      end
    end
  describe "PUT #update" do
    it 'should update the question' do
      new_question = question
      get "/question/#{new_question.id}"
      expect(new_question.title).to eq(JSON.parse(response.body)['title'])
      params = {"question": {"title": "this is updated question", "description": "this is description", "upvote": 5, "downvote": 2}}
      put "/question/#{new_question.id}", params: params
      expect("this is updated question").to eq(JSON.parse(response.body)["title"])
    end
    it "with invalid attributes" do
      new_question = question
      get "/question/#{new_question.id}"
      expect(new_question.title).to eq(JSON.parse(response.body)['title'])
      params = {"question": {"title":nil, "description": "this is updated description", "upvote": 5, "downvote": 2}}
      put "/question/#{new_question.id}", params: params
      expect(422).to eq(response.status)
    end
  end

  describe "DELETE #destroy" do
    it 'should delete the question' do
      new_question = question
      get "/question/#{new_question.id}"
      expect(new_question.title).to eq(JSON.parse(response.body)['title'])
      delete "/question/#{new_question.id}"
      expect("this is a question").to eq(JSON.parse(response.body)["title"])
    end

  end
end