class QuestionsController < ApplicationController
  before_action :set_test
  before_action :set_question
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
      
  def index
    render json: @test.questions
  end
  
  def show 
    render plain: @question.body
  end
  
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_params)
      
    if @question.save
      redirect_to :index
    else
      render :new
    end
  end
  
  def delete
    Question.find(params[:test_id]).destroy
    redirect_to :action => 'list'
  end
  

  private
  
  def question_params
    params.require(:question).permit(:title)
  end
  
  def set_question
    @question = Question.find(params[:id])
  end
  
  def set_test
    @test = Test.find(params[:test_id])
  end
  
  def rescue_with_question_not_found
    render plain: "#{params[:title]} not found" 
  end
end
