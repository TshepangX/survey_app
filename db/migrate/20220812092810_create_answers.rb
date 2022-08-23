class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :multiple_choice
      t.string :open_ended
      t.string :multi_part
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :option
      t.string :question_type
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
