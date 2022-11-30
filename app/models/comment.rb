class Comment < ApplicationRecord
    belongs_to :thre
    
    validates :thre, presence: true
    validates :comment, presence: true, length: { in: 1..1000 }
end
