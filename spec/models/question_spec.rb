require 'rails_helper'

RSpec.describe Question, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject do
    Question.new
  end
  it "Question is not valid without title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "Question is valid with title only" do
    question = Question.new(title: "This is a ruby question", description: nil)
    expect(question).to be_valid
  end


end
