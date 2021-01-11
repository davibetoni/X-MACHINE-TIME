Rails.application.routes.draw do
  #namespace :api do
   # namespace :v1 do
    #  resources :infos
    #end
  #end

  constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do
        resources :infos
      end
    end
  end
  api.capsuladotempo.com/v1/infos
end