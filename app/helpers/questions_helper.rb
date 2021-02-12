module QuestionsHelper
  def question_header(question)
    title = question.persisted? ? 'Edit' : 'Create'
    "#{title} #{question.test.title} Question"
  end
end
