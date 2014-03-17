class Car < ActiveRecord::Base
  validates :price,
            :numericality => {
              :greater_than => 0,
              :less_than => 1_000_000,
              :message => "needs to be more than $0 and less than $1,000,000."
            }
end
