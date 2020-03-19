class BestAnswersController < ApplicationController

	def create
		best_answer = BestAnswer.new(best_answer_params)
		best_answer.save
		# ベストアンサーに選ばれた回答者に50pt加算
		answer_user = AnswerUser.find(best_answer.answer.answer_user_id)
		answer_user.add_best_answer_score
		answer_user.update!(score: answer_user.score)
		# 質問のステータスを解決済みへ変更
		best_answer.question.update(status:"解決済み")
		if best_answer.question.accident.status == "対応中"
			redirect_to new_accident_solution_reports_path(best_answer.question.accident_id)
		else
			flash[:notice]  = 'ベストアンサーを選択しました！'
			redirect_to accident_question_path(best_answer.question.accident, best_answer.question)
		end
	end

	def show
		
	end

# 後で消す！！
	def destroy
		best_answer = BestAnswer.find(params[:id])
		best_answer.destroy
		best_answer.question.update(status:"回答受付中")
		redirect_to accident_question_path(best_answer.question.accident, best_answer.question)
	end

	private
	def best_answer_params
		params.require(:best_answer).permit(:question_id, :answer_id)
	end
end
