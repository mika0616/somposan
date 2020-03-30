class AnswersController < ApplicationController
	before_action :authenticate_answer_user!, only: [:create]
	def create
		@answer = current_answer_user.answers.new(answer_params)
		if @answer.save
			flash[:notice] = '回答を投稿しました！'
			redirect_to accident_question_path(@answer.question, @answer.question)
			# 回答者に解答スコア10ptを加算
			current_answer_user.scores.create(answer_user_id: current_answer_user.id, score: 10, event: "回答投稿")
    		current_answer_user.update(total_score: current_answer_user.total_score + 10)
    		# 回答者のレベルを更新
    		current_answer_user.update_level
		else
			@question = Question.find(@answer.question_id)
			impressionist(@question)
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
