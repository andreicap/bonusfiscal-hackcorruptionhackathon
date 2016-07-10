class PagesController < ApplicationController
  skip_before_action :authenticate_citizen!, :only => [:index, :report, :faq]
  def index

  end

  def report
    @submission = Submission.new
    @submissions = Submission.all
  end

  def faq

  end
end
