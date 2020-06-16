class PuppiesController < ApplicationController
    get '/puppies' do
        erb :display_puppies
    end

    get '/puppies/new' do
        erb :new_puppy
    end

    get '/puppies/:id' do
        # binding.pry
        @puppy = find_puppy(params)

        erb :show
    end

    get '/puppies/:id/edit' do
        @puppy = find_puppy(params)

        erb :edit_puppy
    end

    post '/puppies/' do
        binding.pry
        puppy = Puppy.create(params)

        redirect "/puppies/#{puppy.id}"
    end

    patch '/puppies/:id' do
        # binding.pry
        puppy = Puppy.find(params[:id])
        puppy.update(name: params[:name], breed: params[:breed])

        redirect "/puppies/#{puppy.id}"
    end

    delete '/puppies/:id' do
        # binding.pry
        puppy = Puppy.find(params[:id])
        puppy.delete

        redirect '/puppies'
    end

    def find_puppy(params)
        Puppy.find_by(params)
    end


end