class CohortsController < ApplicationController

  def index
    @cohorts = Cohort.all
    @cohort = Cohort.new
  end

  def create
    cohort = Cohort.new(cohort_params)
    if (cohort.save)
      redirect_to cohorts_path
    else
      render "index"
    end
  end

  def show

  end
  
  private
  def cohort_params
    params.require(:cohort).permit(:name)
  end
end
