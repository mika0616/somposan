class SolutionReportsController < ApplicationController
	def new
		@accident = Accident.find(params[:accident_id])
		@solution_report = SolutionReport.new
	end

	def create
		@solution_report = SolutionReport.new(solution_report_params)
		if @solution_report.save
			@solution_report.accident.update(status:"解決済み")
			redirect_to solve_path
		else
			@accident = Accident.find(params[:accident_id])
			render action: :new
		end
	end

	def edit
		@solution_report = SolutionReport.find(params[:accident_id])
	end

	def update
		@solution_report = SolutionReport.find(params[:accident_id])
		if @solution_report.update(solution_report_params)
			redirect_to accident_path(@solution_report.accident_id)
		else
			render action: :edit
		end
	end

	def solve
		
	end

	def destroy
		
	end

	private
	def solution_report_params
		params.require(:solution_report).permit(:accident_id, :body)
	end
end
