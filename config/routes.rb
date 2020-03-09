Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# rooting
root 'homes#top'

  # homes
  get 'homes/top' => 'homes#top'
  get 'homes/before_login' => 'homes#before_login'
  get 'homes/before_signup' => 'homes#before_signup'
  get 'homes/about' => 'homes#about'
  get 'homes/about_score' => 'homes#about_score'
  get 'homes/about_level' => 'homes#about_level'
  get 'homes/guide' => 'homes#guide'

  # accidents
  resources :accidents, except: [:index]

  # questions
  resources :questions, except: [:index] do
  	member do
  		get 'questions/serch' => 'questions#serch'
  	end
  end

  # answers
  resources :answers, only: [:create, :edit, :update]

  # solution_reports
  resources :solution_reports, except: [:index, :show] do
  	member do
  		get 'solution_reports/solve' => 'solution_reports#solve'
  	end
  end

  # answer_users
  resources :answer_users, except: [:new, :create, :destroy]

  # question_users
  resources :question_users,except: [:index, :new, :create, :destroy]

  # best_answers
  resources :best_answers, only: [:create] do
  	member do
  		get 'best_answers/confirm' => 'best_answers#confirm'
  	end
  end

end
