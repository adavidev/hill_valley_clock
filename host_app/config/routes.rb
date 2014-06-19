HostApp::Application.routes.draw do
  resources :employees do
    resources :clock_time, only: :create
  end

  root to: "employees#index"
end
