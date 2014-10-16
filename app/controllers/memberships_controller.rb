class MembershipsController < ApplicationController

  def create
    name = params[:name]
    membership = Membership.new(membership_params)
    if (membership.save)
      redirect_to :back
    else
      #normally display an error
    end
  end


  def destroy

  end

  private
  def membership_params
    params.require(:membership).permit(:role, :user_id, :cohort_id)
  end

end
