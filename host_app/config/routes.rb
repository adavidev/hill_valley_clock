HostApp::Application.routes.draw do
  resources :employees do
    get "print", to: "employees#print"
  end

  resources :clock_time, only: [:create]

  root to: "employees#index"
end
