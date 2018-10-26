require 'rails_helper'

RSpec.describe Question, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "Question is not valid without title" do
    question = Question.new(title: nil)
    expect(question).to_not be_valid
  end
end
