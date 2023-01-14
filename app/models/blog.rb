class Blog < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    def self.search_blog(keyword)
        where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
    end
    
end
