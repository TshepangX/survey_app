class QuestionsController < ApplicationController
  
  def new 
    @question = Question.new
  end

  def create
    if params[:type].blank?
      @question = Question.new(question_params)
     
    if params[:title].blank?
      flash[:notice] = "Please provide a question"
      redirect_to :back
    elsif
       @question.save
      flash[:notice] = "Question successfully created"
      redirect_to survey_path(@question.survey, question_id: @question.id)
    else 
      render :new
    end 
  else
    redirect_to new_survey_question_path(params[:survey_id], question_type: params[:type])
  end
end

  def edit
    @question = Question.find(params[:id])
  end 

  def update
    @question = Question.find(params[:id])

    if @question.update(update_question_params)
      flash[:notice] = "Question successfully updated"
      redirect_to survey_path(@question.survey, question_id: @question.id)
    else 
      redirect_to edit_survey_question_path(params[:survey_id], question_type: params[:question_type])
    end 
  end 

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question removed"
    redirect_to survey_path(@question.survey, question_id: @question.survey.questions.first)
  end

private 
  def question_params
    params.permit(:title, :option1, :option2, :option3, :option4, :survey_id, :question_id, :question_type)
  end 

  def update_question_params
    params.require(:question).permit(:title, :option1, :option2, :option3, :option4, :survey_id, :question_id, :question_type)
  end
end

