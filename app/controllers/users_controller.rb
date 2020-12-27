class UsersController < ApplicationController

    #Rendering login form
    get '/login' do
       erb :login 
    end

    #Receiving data(params) from login form
    post '/login' do
    #find user and authenticate - then log them in and redirect to user's collection
    user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
           #creates a key/value pair in the sessions hash with user_id to log in
           session[:user_id] = user.id
           redirect "/users/#{user.id}"
        else
           #error msg
           redirect '/login'
        end
    end

    #users collection route
    get '/users/:id' do
        "users collection page!"
    end

end