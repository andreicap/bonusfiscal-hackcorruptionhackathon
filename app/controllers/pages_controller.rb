class PagesController < ApplicationController
  skip_before_action :authenticate_citizen!, :only => [:index, :report]
  def index
    
  end

  def report

  end
end
