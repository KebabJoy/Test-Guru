module TestPassagesHelper
  def question_counter
    "#{@test_passage.current_question_number}/#{@test_passage.test.questions.count}"
  end
end
