module GistsHelper
  def question_shortener(question)
    question.body.truncate(25)
  end

  def gist_hash(url)
    url.split('/').last
  end
end
