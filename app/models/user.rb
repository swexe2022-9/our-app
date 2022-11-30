class User < ApplicationRecord
<<<<<<< HEAD
    validates :password, presence: true,confirmation: true
=======
    has_many :comments, dependent: :destroy
    validates :password, presence: true, confirmation: true
>>>>>>> master
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
