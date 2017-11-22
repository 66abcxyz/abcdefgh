class ProfilesController < ApplicationController
	before_action :find_profile, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@profiles = Profile.all.order("created_at ASC").limit(4)
	end

	def show
		@profile = Profile.friendly.find(params[:id])
		@messages = Message.where(profile_id: @profile)
		@posts = Post.where(profile_id: @profile)
		@posts = Post.all.order("created_at DESC")
		@messages = Message.all.order("created_at DESC")
	end

	def new
		@profile = current_user.profile.build
	end

	def create
		@profile = current_user.profile.build(user_params)

		if @profile.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @profile.update(profile_params)
			redirect_to @profile, :notice => "Your Official Link is Successfully changed. Share it with your Friends and Everyone. You can change it Again."
		else
			render 'edit'
		end
	end

	private

	def find_profile
		@profile = Profile.friendly.find(params[:id])
	end

	def profile_params
		params.require(:profile).permit(:line1, :line2, :slug)
	end
end
