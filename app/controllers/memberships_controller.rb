class MembershipsController < ApplicationController
  before_action :authenticate_user!
  def create
    membership = Membership.new(membership_params)
    if (membership.role == "Student" || membership.role == "Teacher")
      if (membership.save)
        redirect_to :back
      else
        redirect_to :back
      end
    else
      redirect_to :back
    end
  end

  def destroy
    membership = Membership.find(params[:id])
    membership.destroy
    redirect_to :back
  end

  private
  def membership_params
    params.require(:membership).permit(:role, :user_id, :cohort_id)
  end

end
