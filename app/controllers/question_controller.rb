require 'pry'
class QuestionController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    @question = Question.new
    render json: @question, status: :ok
  end

  def index
    @question = Question.all
    render json: @question, status: :ok
  end

  def show
    @question = Question.find(params[:id])
    render json: @question, status: :ok
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      render json: @question, status: :ok
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # def update
  #   @question = Question.find(params[:id])
  #   if
  # end

  private
  def question_params
    params.require(:question).permit(:title, :description, :upvote, :downvote)
  end
end
