class AccidentsController < ApplicationController
	def new
		@accident = Accident.new
	end

	def create
		@accident = Accident.new(accident_params)
		if @accident.save
			redirect_to new_question_path
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

	private
	def accident_params
		params.require(:accident).permit(:title, :body, :situation_img, :question_user_damage, :the_other_damage)
	end
end
