class UsersController < ApplicationController 

  def index
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @users = User.all
    if (@user.save)
      redirect_to users_path
    else
      render "index"
    end
  end

  def show
    @user = User.find(params[:id])
    @memberships = @user.memberships
    @cohort_names = []
    @memberships.each do |m|
      cohort_name = Cohort.find(m.cohort_id).name
      @cohort_names.push(cohort_name)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

end
