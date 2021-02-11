module QuestionsHelper
  def question_header(question)
    title = question.nil? ? 'Edit' : 'Create'
    "#{title} #{Test.find(params[:id]).title} Question"
  end
end
