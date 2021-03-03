class GistQuestionService

  ACCESS_TOKEN = ENV['GIT_ACCESS_TOKEN']

  GistInfo = Struct.new(:url, :success?)

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
    gist = @client.create_gist(gist_params)   # https://docs.github.com/en/rest/reference/gists#create-a-gist
    GistInfo.new(gist.html_url, @client.last_response.status)
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from Test Guru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:title)].join("\n")
  end

end
