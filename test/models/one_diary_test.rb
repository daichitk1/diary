require "test_helper"

class OneDiaryTest < ActiveSupport::TestCase
  test "one diary per date remains enforced" do
    duplicate = OneDiary.new(title: "duplicate", content: "synthetic", date: one_diaries(:one).date)
    assert_not duplicate.valid?
    assert duplicate.errors.added?(:date, :taken, value: duplicate.date)
  end
end
