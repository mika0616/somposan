Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# rooting
get 'homes#top'

  # homes
  get 'homes/top'
  get 'homes/before_login'
  get 'homes/before_signup'
  get 'homes/about'
  get 'homes/about_score'
  get 'homes/about_level'
  get 'homes/guide'

  # accidents
  resources :accidents, except: [:index]

  # questions
  resources :questions, except: [:index] do
  	member do
  		get 'serch'
  	end
  end

  # answers
  resources :answers, only: [:create, :edit, :update]

  # solution_reports
  resources :solution_reports, except: [:index, :show] do
  	member do
  		get 'solve'
  	end
  end

  # answer_users
  resources :answer_users, except: [:new, :create, :destroy]

  # question_users
  resources :question_users,except: [:index, :new, :create, :destroy]

  # best_answers
  resources :bext_answers, only: [:create] do
  	member do
  		get 'confirm'
  	end
  end

end
