class Thre < ApplicationRecord
    has_many :comments, dependent: :destroy
end
