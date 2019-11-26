class TestsController < ApplicationController
  before_action :find_test, only: [:show, :update, :edit]
  
  def show
  end

  def index
		@tests = Test.all
  end

  def new
  	@test = Test.new
  end

  def edit
  end

  def update
    if @test.update(test_params)
    redirect_to @test
    else
    render :edit
    end
  end	

  def create
  	@test = Test.new(test_params)

  	if @test.save
  		redirect_to @test
  	else
  		render :new
  	end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
		@test = Test.find(params[:id])
  end

end
