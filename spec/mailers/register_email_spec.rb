require "rails_helper"

RSpec.describe RegisterEmailMailer, type: :mailer do
  describe "welcome_email" do
    let(:user) {build(:user)}
    let(:mail) { RegisterEmailMailer.welcome_email(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("thanks for registering in Knowledge base")
      expect(mail.to).to eq(["vijay@email.com"])
      expect(mail.from).to eq(["knowledgebased@email.com"])
    end
  end

end
