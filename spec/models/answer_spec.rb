require 'rails_helper'

RSpec.describe Answer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"


  it "Answer is not valid without " do

    subject.description = nil
    expect(subject).to_not be_valid
  end

  let(:question) {Question.create(title: "This is a ruby question", description: "some description")}

  it "should have valid description" do
    answer = Answer.new

    answer.description = "your answer"
    answer.question_id = question.id

    expect(answer).to be_valid
  end
end
