class Car < ActiveRecord::Base
  validates :make, :model, :year, presence: true
  validates :price,
            :presence => true,
            :numericality => {
              :greater_than => 0,
              :less_than => 1_000_000,
              :message => "is not a number or needs to be more than $0 and less than $1,000,000."
            }

  belongs_to :user
end
