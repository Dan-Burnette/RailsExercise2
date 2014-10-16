class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :cohort

  validates :role, presence: true
end
