class MessagesController < ApplicationController
	before_action :authenticate_user!

	def show
		@message = Message.find(params[:id])
	end

	def create
		@post = Post.find(params[:post_id])
		@message = Message.create(params[:message].permit(:line1))
		@message.user_id = current_user.id
		@message.post_id = @post.id

		if @message.save
			redirect_back fallback_location: :back, :notice => "Your Message is Successfully Sent. See it below."
		else
			render 'new'
		end
	end

	def edit
		@message = Message.find(params[:id])
	end

	def update
		@message = Message.find(params[:id])
		if @message.update(message_params)
			redirect_to @message
		else
			render 'edit'
		end
	end

	def destroy
		@message = Message.find(params[:id])
		@message.destroy
		redirect_back fallback_location: :back
	end

	private

	def find_message
		@message = Message.find(params[:id])
	end

	def message_params
		params.require(:message).permit(:line1, :line2, :line3)
	end
end
