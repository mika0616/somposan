class AnswersController < ApplicationController

	def create
		@answer = current_answer_user.answers.new(answer_params)
		if @answer.save
			flash[:notice]
			binding.pry
			redirect_to accident_question_path(:accident_id => @answer.question.accident_id, :id => answer_params[:question_id], method: :get)
		else
			@question = Question.find(answer_params[:question_id])
			@answer = Answer.new
			@best_answer = BestAnswer.new
			render 'questions/show'
		end
	end

	def edit
		
	end

	def update
		
	end

	private
	def answer_params
		params.require(:answer).permit(:body, :question_id)
	end

end
