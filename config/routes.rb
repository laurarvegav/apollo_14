Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/astronauts",to: "astronaut#index"
  get "/astronauts/:id",to: "astronaut#show"
  post "/astronauts/:id/missions",to: "astronaut_missions#create"
end