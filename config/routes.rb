Rails.application.routes.draw do
  # rooting
  root 'homes#top'

  # devise
  devise_for :answer_users, controllers: {
    sessions: "answer_users/devise/sessions",
    passwords: "answer_users/devise/passwords",
    registrations: "answer_users/devise/registrations"
  }

  devise_for :question_users, controllers: {
    sessions: "question_users/devise/sessions",
    passwords: "question_users/devise/passwords",
    registrations: "question_users/devise/registrations"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # homes
  get 'homes/top' => 'homes#top'
  get 'homes/before_login' => 'homes#before_login'
  get 'homes/before_signup' => 'homes#before_signup'
  get 'homes/about' => 'homes#about'
  get 'homes/about_score' => 'homes#about_score'
  get 'homes/about_level' => 'homes#about_level'
  get 'homes/guide' => 'homes#guide'
  get 'homes/about_situation' => 'homes#about_situation'
  get 'solve' => 'homes#solve'

  # accidents
  resources :accidents, except: [:index] do
    # questions
    resources :questions, except: [:index] do
      # favorites
      resources :favorites, only: [:create, :destroy]
    end
    # solution_reports
    resources :solution_reports, except: [:index, :show] do
    member do
      get 'solve' => 'solution_reports#solve'
    end
  end
  end
  get 'questions/serch' => 'questions#serch'
  get 'questions' => 'questions#index'

  # tags
  get 'tags/:tag', to: 'questions#index', as: :tag

  # answers
  resources :answers, only: [:create, :edit, :update]

  # answer_users
  resources :answer_users, except: [:new, :create, :destroy]

  # question_users
  resources :question_users,except: [:index, :new, :create, :destroy]

  # best_answers
  resources :best_answers, only: [:create, :destroy] do
  	member do
  		get 'best_answers/confirm' => 'best_answers#confirm'
  	end
  end

end
