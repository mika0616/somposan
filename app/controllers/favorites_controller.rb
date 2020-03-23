class FavoritesController < ApplicationController

	def create
		question = Question.find(params[:question_id])
		if question_user_signed_in?
			favorite = current_question_user.favorites.new(question_id: question.id)
		else
			favorite = current_answer_user.favorites.new(question_id: question.id)
		end
		favorite.save
		redirect_to accident_question_path(question.accident_id, question.id)
	end

	def destroy
		question = Question.find(params[:question_id])
		if question_user_signed_in?
			favorite = current_question_user.favorites.find_by(question_id: question.id)
		else
			favorite = current_answer_user.favorites.find_by(question_id: question.id)
		end
		favorite.destroy
		redirect_to accident_question_path(question.accident_id, question.id)
	end
end
