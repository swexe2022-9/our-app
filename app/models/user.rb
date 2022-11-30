class User < ApplicationRecord
    validates :password, presence: true,confirmation: true
    validates :uname, presence: true
    validates :email, presence: true, uniqueness: true


    attr_accessor :password, :password_confirmation
    
    def password=(val)
        if val.present?
            self.pass = BCrypt::Password.create(val)
        end
    @password = val
    end
end
