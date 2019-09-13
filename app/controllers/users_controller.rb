class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new(
            name: params[:name],
            email: params[:email],
            password: params[:password],
            password_confirmation: params[:confirm_password],
        )

        if @user.save
            
            if @user.email == 'aaron.y.boateng@gmail.com'
                session[:admin] = true
            else
                session[:admin] = false
            end

            session[:user_id] = @user.id
            flash[:success] = 'Successfully created user'
            redirect_to '/'
        else
            flash[:warning] = 'Invalid email or password'
            redirect_to '/signup'
        end
    end

end
