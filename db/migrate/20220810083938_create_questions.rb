class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :multiple_choice
      t.string :open_ended
      t.string :multi_part
      t.string :question_type
      t.references :survey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
