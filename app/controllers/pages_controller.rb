class PagesController < ApplicationController
  skip_before_action :authenticate_citizen!, :only => [:index, :report, :faq]
  def index
    
  end

  def report

  end

  def faq

  end
end
