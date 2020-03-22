class HomesController < ApplicationController
	def top
		@questions = Question.all
		@most_viewed = Question.order('impressions_count DESC')
		@answer_users = AnswerUser.all.order('score DESC').limit(10)
		@tags = ActsAsTaggableOn::Tag.most_used(15)
	end

	def before_login
		
	end

	def before_signup
		
	end

	def about
		
	end

	def about_socore
		
	end

	def about_level
		
	end

	def guide
		
	end
	def about_situation
		
	end
	def solve
		
	end
end
