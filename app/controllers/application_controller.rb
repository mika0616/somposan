class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search_question

# ログイン後のpath
def after_sign_in_path_for(resource)
	root_path
end

# ログアウト後のpath
def after_sign_out_path_for(resource)
	root_path
end

private
def set_search_question
  # 検索バー表示のために常に@qを生成する
  # 検索時以外params[:q]はnilだが、空のransackオブジェクト生成の動作になる
  @q = Question.ransack(params[:q])
end

protected

	def configure_permitted_parameters
		if resource_class == QuestionUser
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  		devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    elsif resource_class == AnswerUser
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :production, :status, :career, :speciality, :qualification])
    end
  end
end
