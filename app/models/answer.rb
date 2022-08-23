class Answer < ApplicationRecord
  belongs_to :question

  validates :question_id, presence: true
  validate :pick_an_answer
  validate :pick_more_answers
  

  def pick_an_answer
    if question.question_type == "multiple_choice"
      if option.blank?
        errors.add(:multiple_choice, 'select one answer')
      end 
    end 
  end 
 
  def pick_more_answers
    if question.question_type == "multi_part"
      if option1 == "0"  && option2 == "0" && option3 == "0" && option4 == "0"
        errors.add(:multi_part, 'select an answer') 
      end 
    end 
  end 

end
