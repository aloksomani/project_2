class StaticPagesController < ApplicationController

  before_action :authenticate, only: [:show]
  before_action :correct_user, only: [:show]
  
  def index
  end

end
