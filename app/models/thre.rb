class Thre < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, presence: true
    
    def self.search(keyword)
      where(["title like?", "%#{keyword}%"])
    end
end
