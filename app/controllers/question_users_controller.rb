class QuestionUsersController < ApplicationController
	def edit
		@question_user = QuestionUser.find(params[:id])
	end

	def update
		@question_user = QuestionUser.find(params[:id])
		if @question_user.update(question_user_params)
			flash[:notice]  = 'プロフィールを編集しました！'
			redirect_to question_user_path(@question_user.id)
		else
			render action: :edit
		end
	end

	def show
		@question_user = QuestionUser.find(params[:id])
	end

	private
	def question_user_params
		params.require(:question_user).permit(:name)
	end

end
