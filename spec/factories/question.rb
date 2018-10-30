FactoryBot.define do
  factory :question do
    title {"this is a question"}
    description {"this is description"}
    upvote {5}
    downvote {2}
  end
end