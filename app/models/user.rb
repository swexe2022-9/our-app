class User < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :password, presence: true, confirmation: true
    validates :uname, presence: true
    validates :email, presence: true


    attr_accessor :password, :password_confirmation
    def password=(val)
        if val.present?
            self.pass = BCrypt::Password.create(val)
        end
    @password = val
    end
end
