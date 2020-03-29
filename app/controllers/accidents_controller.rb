class AccidentsController < ApplicationController
	before_action :authenticate_question_user!, only: [:new, :create, :edit, :update]
	def new
		@accident = Accident.new
	end

	def create
		@accident = current_question_user.accidents.new(accident_params)
		if @accident.save
			redirect_to new_accident_question_path(@accident)
		else
			render action: :new
		end
	end

	def edit
		@accident = Accident.find(params[:id])
	end

	def update
		@accident = Accident.find(params[:id])
		if @accident.update(accident_params)
			flash[:notice]  = '事故内容を編集しました！'
			redirect_to accident_path(@accident.id)
		else
			render action: :edit
		end
	end

	def show
		@accident = Accident.find(params[:id])
		@solution_report = SolutionReport.new
	end

	def destroy
		
	end

	private
	def accident_params
		params.require(:accident).permit(:title, :body, :situation_img, :question_user_damage, :the_other_damage)
	end
end
