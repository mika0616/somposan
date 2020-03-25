class BestAnswersController < ApplicationController

	def create
		best_answer = BestAnswer.new(best_answer_params)
		best_answer.save
		# ベストアンサーに選ばれた回答者に50pt加算
		best_answer.answer_user.scores.create(answer_user_id: best_answer.answer_user_id, score: 100, event: "ベストアンサー獲得")
		best_answer.answer_user.update(total_score: best_answer.answer_user.total_score + 100)
		# ベストアンサーに選ばれた回答者のレベルを更新
		best_answer.answer_user.update_level
		# 質問のステータスを解決済みへ変更
		best_answer.question.update(status:"解決済み")
		if best_answer.question.accident.status == "対応中"
			redirect_to new_accident_solution_report_path(best_answer.question.accident_id)
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
		params.require(:best_answer).permit(:question_id, :answer_id, :answer_user_id)
	end
end
