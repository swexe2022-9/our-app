require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
   test "email addresses should be unique" do
    duplicate_user = @users.dup
    @users.save
    assert_not duplicate_user.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
