class QuestionsController < ApplicationController
    
    before_action :find_test
    
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
    
    def show 
       render plain: @question.body
    end
    
    def index
        render json: @test.questions
    end
    
    def new
       # byebug 
       @question = Question.new
    end
    
    def delete
       Question.find(params[:test_id]).destroy
       redirect_to :action => 'list'
    end
    
    def create
        @question = Test.new(question_params)
        
        if @question.save
            redirect_to :index
        else
            render :new
        end
    end
    
    private
    
    def question_params
        params.require(:question).permit(:title)
    end
    
    def find_question
        @question = Question.find(params[:id])
    end
    
    def find_test
        @test = Test.find(params[:test_id])
    end
    
    def rescue_with_question_not_found
       render plain: "#{params[:title]} not found" 
    end
end
