class AnswerUsersController < ApplicationController
	before_action :authenticate_answer_user!
		def index
		
	end

	def edit
		@answer_user = AnswerUser.find(params[:id])
	end

	def update
		@answer_user = AnswerUser.find(params[:id])
		if @answer_user.update(answer_user_params)
			flash[:notice]  = 'プロフィールを編集しました！'
			redirect_to answer_user_path(@answer_user.id)
		else
			render action: :edit
		end
	end

	def show
		@answer_user = AnswerUser.find(params[:id])
	end

	private
	def answer_user_params
		params.require(:answer_user).permit(:name, :production, :status, :career, :speciality, :qualification)
	end
end
