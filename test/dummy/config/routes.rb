Rails.application.routes.draw do
  resources :pages

  mount BootstrapCostumes::Engine => "/bootstrap_costumes", as: :bootstrap_costumes
end
