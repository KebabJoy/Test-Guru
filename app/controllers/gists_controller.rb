class GistsController < ApplicationController
  def create
    test_passage = TestPassage.find(params[:test_passage_id])
    service = GistQuestionService.new(test_passage.current_question)
    result = service.call

    if service.success?
      Gist.create!(user: current_user, question_id: test_passage.current_question.id, url: result.url)
      flash_options = {notice: t('.success', url: result.url)}
    else
      flash_options = {alert: t('.failure')}
    end
    redirect_to test_passage, flash_options
  end
end