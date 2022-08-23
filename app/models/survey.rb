class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :user

  before_create {|survey| survey.title = survey.title.titleize}
  
  validates :title, presence: true 
end
