class Thre < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, presence: true
    validates :title, presence: false
end
