class SearchController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @profiles = Profile.search(params[:search])
  end
end
