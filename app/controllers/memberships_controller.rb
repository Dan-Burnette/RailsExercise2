class MembershipsController < ApplicationController

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

  end

  private
  def membership_params
    params.require(:membership).permit(:role, :user_id, :cohort_id)
  end

end
