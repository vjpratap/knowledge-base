# Preview all emails at http://localhost:3000/rails/mailers/register_email
class RegisterEmailPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/register_email/welcome_email
  def welcome_email
    RegisterEmailMailer.welcome_email(build(:user))
  end

end
