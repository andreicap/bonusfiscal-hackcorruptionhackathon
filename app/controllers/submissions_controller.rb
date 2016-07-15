class SubmissionsController < ApplicationController

  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :set_submissions, only: [:index]
  skip_before_action :authenticate_citizen!, :only =>[:index, :show, :edit, :update, :destroy, :create]
  def index

  end

  def show
  end

  def new
    @submission = Submission.new
  end

  def edit
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.citizen_id = current_citizen.id if citizen_signed_in?

    respond_to do |format|
      if @submission.save
        format.html { redirect_to @submission, notice: "Raportarea a fost efectuată cu succes" }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors.full_messages, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Raportarea a fost ștearsă cu succes.' }
      format.json { head :no_content }
    end
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def set_submissions
    @submissions = Submission.all
  end

  def submission_params
    params.require(:submission).permit!
  end

end
