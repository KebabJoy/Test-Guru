class GistsController < ApplicationController
  def create
    test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(test_passage.current_question).call

    if result.success?
      Gist.create!(user: current_user, question: test_passage.current_question, url: result.html_url)
      flash_options = {notice: "#{ActionController::Base.helpers.link_to(t('.success'), result.html_url,rel: 'nofollow', target: '_blank')}"}
    else
      flash_options = {alert: t('.failure')}
    end
    redirect_to test_passage, flash_options
  end
end
