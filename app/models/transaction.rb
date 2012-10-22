class Transaction < ActiveRecord::Base
    attr_accessible :amount

    belongs_to :farm, :customer, :venue
end
