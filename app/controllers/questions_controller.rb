class QuestionsController < ApplicationController

	def index
		
	end

	def new
		@question = Question.new
	end

	def create
		accident = Accident.find(params[:accident_id])
		@question = current_question_user.questions.new(question_params)
		@question.accident_id = accident.id
		if @question.save
			flash[:notice]  = '質問を投稿しました！ついた回答からベストアンサーを選びましょう。'
			redirect_to accident_question_path(@question,@question)
		else
			render action: :new
		end
	end 

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		if @question.update(question_params)
			flash[:notice]  = '質問を編集しました！ついた回答からベストアンサーを選びましょう。'
			redirect_to accident_question_path(@question,@question)
		else
			render action: :edit
		end
	end

	def show
		@question = Question.find(params[:id])
		@answer = Answer.new
		@best_answer = BestAnswer.new
	end

	def destroy
		
	end

	def serch
	    # application controllerで生成した@qを利用して検索する
	    @q_questions = @q.result(distinct: true).reverse_order
	    render :index
	end

	private
	def question_params
		params.require(:question).permit(:title, :body, tag_ids:[])
	end
end
