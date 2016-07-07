class LotteryController < ApplicationController
  skip_before_action :authenticate_citizen!, :only => [:index]

  def index
    
  end

  def generate_winners
    puts "generator ============================"
    redirect_to '/lottery'
  end
  
end
