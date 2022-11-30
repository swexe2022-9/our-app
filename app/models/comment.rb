class Comment < ApplicationRecord
    belongs_to :thread
    
    validates :thre, presence: true
    validates :commet, presence: true, length: { in: 1..1000 }
end
