class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:create]

	def create
		@profile = Profile.friendly.find(params[:profile_id])
		@post = Post.create(params[:post].permit(:image, :line1))
		if user_signed_in?
			@post.user_id = current_user.id
			@post.profile_id = @profile.id
		else
			@post.profile_id = @profile.id
		end

		if @post.save
			redirect_back fallback_location: :back, :notice => "You've Successfully Sent it. See it on this User and your Profile if You've Signed In."
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to profile_path(current_user)
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:line1, :line2, :line3, :image)
	end
end
