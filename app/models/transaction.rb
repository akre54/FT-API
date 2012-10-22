class Transaction < ActiveRecord::Base
    attr_accessible :amount

    belongs_to :farm
    belongs_to :customer
    belongs_to :venue
end
