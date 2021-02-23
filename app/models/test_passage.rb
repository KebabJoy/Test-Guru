class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :set_next_question

  scope :questions_left, -> {test.questions.order(:id).where('id > ?', current_question.id)}

  SUCCESS_RATE = 85.0.freeze

  def current_question_number
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def success?
    stats > SUCCESS_RATE
  end

  def test_result
    (correct_questions * 100 / test.questions.count).round(2)
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def next_question
    questions_left.first
  end

  private

  def correct_answer?(answer_ids)
    if answer_ids.nil?
      return false
    end
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def set_next_question
    self.current_question = next_question
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answers
    current_question.answers.correct
  end

  def remaining_questions
    questions_left.count
  end
end