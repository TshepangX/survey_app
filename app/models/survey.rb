class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :user

  before_create :titilize_title

  validates :title, presence: true 

  def titilize_title
    self.title = self.title.titleize
  end
end
