require "test_helper"

class SentenceTest < ActiveSupport::TestCase
  test "if the origin <-> descendants association is correct" do
    sent1 = sentences(:one)
    sent2 = sentences(:two)

    assert_equal sent1.origin, sent2
    assert_equal sent1.descendants.count, 0
    assert_equal sent2.descendants.count, 1
    assert_equal sent2.descendants.first, sent1
  end
end
