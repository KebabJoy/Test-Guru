class QuestionsController < ApplicationController
  before_action :set_test, only: %i[create new]
  before_action :set_question, only: %i[show delete edit update]
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def edit; end

  def show 
    @answers = @question.answers
  end
  
  def new
    @question = @test.questions.new
  end
  
  def create
    @question = @test.questions.new(question_params)
      
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end
  
  def delete
    @question.destroy
    redirect_to @question
  end

  private
  
  def question_params
    params.require(:question).permit(:body)
  end
  
  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end
  
  def rescue_with_question_not_found
    render plain: "Such test was not found" 
  end
end
