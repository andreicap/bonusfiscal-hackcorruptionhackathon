class LotteryController < ApplicationController
  skip_before_action :authenticate_citizen!, :only => [:index]

  def index
    
  end
  
end
