class UsersController < ApplicationController
  before_action :authenticate_user!
  attr_accessor :email

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, :notice => "You have Succesfully Signed up! Here is Your Profile."
    else
      render "new"
    end
  end

  def edit
	end

	def update
    @user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to profile_path(@user.profile), :notice => "Your Profile Picture is Succesfully Updated!"
		else
			render 'edit'
		end
	end

  def show
    @user = User.find(params[:id])
  end

  def current_user_home
    redirect_to current_user
  end

  private

	def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :name, :username, :line1, :image)
	end
end
