class User < ActiveRecord::Base
  has_many :cohorts, through: :memberships
  has_many :memberships

  validates :name, presence: true
end
