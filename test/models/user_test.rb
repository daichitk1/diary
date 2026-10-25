require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "existing password model hashes and verifies synthetic passwords" do
    user = User.new(password: "synthetic-only-password")
    assert user.password_digest.start_with?("$2")
    assert_equal user, user.authenticate("synthetic-only-password")
    assert_equal false, user.authenticate("incorrect-synthetic-password")
    assert_not_equal "synthetic-only-password", user.password_digest
  end
end
