class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  #before other methods (sessions, regristration...) are processed this will be processed
  before_action :set_current_user 

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id:session[:user_id]) #find_by serve pra nao crashar a pagina caso o usuário do cookie não seja encontrado -- a alternativa, find sem o by, da erro se o user no cookie não for encontrado
    end
  end

  def require_user_logged_in!
    if Current.user.nil?
      redirect_to sign_in_path, alert: "You must be signed in to do that." 
    end
  end
end
