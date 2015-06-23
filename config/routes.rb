Rails.application.routes.draw do
  root 'weather_report#index'

  get 'search' => 'weather_report#search'
end
