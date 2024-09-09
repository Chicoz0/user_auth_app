class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      #send email
      PasswordMailer.with(user: @user).reset.deliver_now #could be "later" pra não demorar
    end
    redirect_to root_path, notice: "If an account with that email was found, we  have sent email a link to reset your password"
  end
end