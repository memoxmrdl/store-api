Rails.application.routes.draw do
  constraints ApiConstraint do
    resources :articles
  end
end
