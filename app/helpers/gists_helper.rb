module GistsHelper
  def question_shortener(question)
    question.body.truncate(25)
  end
end