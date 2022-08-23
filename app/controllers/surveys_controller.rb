class SurveysController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show
 
  def index
    @surveys = Survey.all
  end

  def show 
    @survey = Survey.find(params[:id])
    begin
      @question = @survey.questions.find(params[:question_id])
    rescue ActiveRecord::RecordNotFound
      @question = nil
    end
  end

  def report
    @survey = Survey.find(params[:survey_id]) 
  end

  def new 
    @survey = current_user.surveys.build
  end 

  def create
    @survey = current_user.surveys.build(survey_params)

    if @survey.save
      flash[:notice] = "Survey successfully created"
      redirect_to surveys_path
    else
      render :new
    end 
  end 

  def edit
    @survey = Survey.find(params[:id])
  end 

  def update 
    @survey = Survey.find(params[:id])

    if @survey.update(survey_params)
      flash[:notice] = "Survey successfully updated"
      redirect_to survey_path(@survey, question_id: @survey.questions.first.id)
    else 
      render :edit
    end 
  end 

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "Survey deleted"
    redirect_to surveys_path
  end 

  
private
  def survey_params
    params.require(:survey).permit(:title, :survey_id, :question_id, :question_type)
  end 
end
 

