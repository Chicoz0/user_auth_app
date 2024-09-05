class MainController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find_by(id:session[:user_id]) #find_by serve pra nao crashar a pagina caso o usuário do cookie não seja encontrado -- a alternativa, find sem o by, da erro se o user no cookie não for encontrado
    end
  end
end