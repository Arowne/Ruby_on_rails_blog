class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])

            if user.email == 'aaron.y.boateng@gmail.com'
                session[:admin] = true
            else
                session[:admin] = false
            end

            session[:user_id] = user.id
            flash[:success] = 'Successfully Logged In!'
            redirect_to '/'
        else
            flash[:warning] = "Invalid email or password"
            redirect_to '/login'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Successfully Logged Out!"
        redirect_to '/login'
    end
        
end
