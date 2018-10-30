class QuestionController < ApplicationController

  def new
    @question = Question.new
  end

  def index
    @question = Question.all
    render json: @question, status: :ok
  end
end
