class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :description
      t.integer :upvote
      t.integer :downvote
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
