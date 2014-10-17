class MembershipsController < ApplicationController
  before_action :authenticate_user!
  def create
    user_membership = Membership.find_by("user_id == ? AND cohort_id == ?", current_user.id, membership_params[:cohort_id])
    membership = Membership.new(membership_params)
    if (user_membership != nil)
      user_role = user_membership.role
      if (user_role == "Student" || user_role == "Teacher")
        if (membership.save)
          redirect_to :back
        else
          redirect_to :back
        end
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
