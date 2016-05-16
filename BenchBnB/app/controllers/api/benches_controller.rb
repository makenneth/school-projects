class Api::BenchesController < ApplicationController
  def index
  	@benches = Bench.in_bounds(params[:bounds])
  	render json: @benches
  end

  def create
    @bench = Bench.new(bench_params)
    if @bench.save
      render json: @bench
    else
      render status: 422
    end
  end

  def show
  	@bench = Bench.find(params[:id])
  	render json: @bench
  end

  private
  def bench_params
    params.require(:bench).permit(:description, :lat, :lng, :seating);
  end
end
