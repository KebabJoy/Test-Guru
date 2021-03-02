class GistQuestionService

  ACCESS_TOKEN = ENV['GIT_ACCESS_TOKEN']

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
    @client.create_gist(gist_params)   # https://docs.github.com/en/rest/reference/gists#create-a-gist
  end

  def success?
    @client.last_response.status == 201
  end

  def url
    @client.last_response.headers[:location]
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