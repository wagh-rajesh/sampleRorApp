class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		p "Login Successful"
  		log_in user
 		redirect_to user
  	else
  		flash.now[:danger] = "Invalid Username/Password combination"
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	redirect_to root_path
  end

end
