class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User created successfully!'
    else
      # Se o save falhar, renderiza a view `new` com o status `unprocessable_entity`
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Certifique-se de que este método está definido corretamente
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end