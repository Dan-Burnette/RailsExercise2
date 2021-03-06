class CohortsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cohorts = Cohort.all
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    @cohorts = Cohort.all
    if (@cohort.save)
      redirect_to cohorts_path
    else
      render "index"
    end
  end

  def show
    @all_users = User.all
    @cohort = Cohort.find(params[:id])
    @memberships = @cohort.memberships
    @users= []
    @memberships.each do |m|
      user = User.find(m.user_id)
      @users.push(user)
    end
  end
  
  private
  def cohort_params
    params.require(:cohort).permit(:name)
  end
end
