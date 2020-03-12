class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

# ログイン後のpath
def after_sign_in_path_for
	root_path
end

# ログアウト後のpath
def after_sign_out_path_for
	root_path
end

protected
	def configure_permitted_parameters
		if resource_class == QuestionUser
    		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    	elsif resource_class == AnswerUser
    		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    	end
  	end
end
