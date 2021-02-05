class TestsController < ApplicationController

  def index
    render json: { tests: Test.all }
  end
  
  def show
    redirect_to test_questions_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
