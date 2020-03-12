class QuestionsController < ApplicationController

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		if @question.save
			flash[:notice]  = '質問を投稿しました！&#13;&#10;ついた回答からベストアンサーを選びましょう。'.html_safe
			redirect_to question_path(params[:id])
		else
			render action: :new
		end
	end

	def edit
		
	end

	def update
		
	end

	def show
		
	end

	def destroy
		
	end

	def serch
		
	end
end
