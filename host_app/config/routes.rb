HostApp::Application.routes.draw do
  resources :employees

  resources :clock_time, only: [:create]

  root to: "employees#index"
end
