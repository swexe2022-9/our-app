class Comment < ApplicationRecord
    belongs_to :thre
    #belongs_to :user
    validates :thre, presence: true
    validates :comment, presence: true, length: { in: 1..1000 }
end
