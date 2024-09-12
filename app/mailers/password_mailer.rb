class PasswordMailer < ApplicationMailer
  def reset
    @token = params[:user].signed_id(purpose:"password_reset", expires_in: 15.minutes)
    mail to: params[:user].email
  end

  def test_email
      mail(to: "test@example.com", subject: "Test Email", body: "This is a test email.")
  end
  
end
