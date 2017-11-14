class SearchController < ApplicationController
  before_action :authenticate_user!

  def show
    @users = User.search(params[:search])
  end
end
