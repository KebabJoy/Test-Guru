class GistsController < ApplicationController
  def create
    test_passage = TestPassage.find(params[:test_passage_id])
    service = GistQuestionService.new(test_passage.current_question)
    result = service.call

    if service.success?
      Gist.create!(user: current_user, question: test_passage.current_question, url: result.html_url)
      flash_options = {notice: t('.success', url: result.html_url)}
    else
      flash_options = {alert: t('.failure')}
    end
    redirect_to test_passage, flash_options
  end
end
