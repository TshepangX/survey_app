class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: :create
  
  def new
    @answer = Answer.new
  end

  def create
    question = Question.find(params[:answer][:question_id])
    survey = Survey.find(params[:answer][:survey_id])
    @answer = Answer.new(answer_params)
  
    if @answer.save 
      if question != question.survey.questions.last
        questions = question.survey.questions
        next_question = survey.questions.where('id > ?', question.id).order(:id).first

        redirect_to survey_path(question.survey, question_id: next_question.id)
      else 
        redirect_to root_path
      end
    else
      redirect_to survey_path(question.survey, question_id: params[:answer][:question_id]), alert: @answer.errors.full_messages[0]
    end
  end

private
  def answer_params 
    params.require(:answer).permit(:option, :option1, :option2, :option3, :option4, :question_id, :question_type, :open_ended, :multi_part, :multiple_choice) 
  end 
end
