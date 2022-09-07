class SurveyReportsGenerator

  def initialize(question:nil , answer: nil)
    @question = question
    @answer = answer
  end 

  def count_answers
    @question.answers.count.to_f 
  end 

  def average_answer
    if @question.question_type == 'multiple_choice'
      averages = multiple_choice_average_calculator(@question)
    else
      averages = multi_part_average_calculator(@question)
    end
  end

  private
  def multiple_choice_average_calculator(question)
    averages = {}
    if question.option1.present?
      averages.merge!(question.option1 => ((question.answers.where(option: question.option1).count.to_f / question.answers.count.to_f) * 100).round(2))
    end
    if question.option2.present?
      averages.merge!(question.option2 => ((question.answers.where(option: question.option2).count.to_f / question.answers.count.to_f) * 100).round(2))
    end
    if question.option3.present?
      averages.merge!(question.option3 => ((question.answers.where(option: question.option3).count.to_f / question.answers.count.to_f) * 100).round(2))
    end
    if question.option4.present?
      averages.merge!(question.option4 => ((question.answers.where(option: question.option4).count.to_f / question.answers.count.to_f) * 100).round(2))
    end
  end

  def multi_part_average_calculator(question)
    averages = {}
    if question.answers.count != 0
      if question.option1 != '0'
        averages.merge!(question.option1 => ((question.answers.where(option1: question.option1).count.to_f / question.answers.count.to_f) * 100).round(2))
      end
      if question.option2 != '0' 
        averages.merge!(question.option2 => ((question.answers.where(option2: question.option2).count.to_f / question.answers.count.to_f) * 100).round(2))
      end
      if question.option3 != '0'
        averages.merge!(question.option3 => ((question.answers.where(option3: question.option3).count.to_f / question.answers.count.to_f) * 100).round(2))
      end
      if question.option4 != '0'
        averages.merge!(question.option4 => ((question.answers.where(option4: question.option4).count.to_f / question.answers.count.to_f) * 100).round(2))
      end
    end
  end
end
 