require "test_helper"

class SentenceTest < ActiveSupport::TestCase
  test "the truth" do
    sent1 = sentences(:one)
    sent2 = sentences(:two)

    # Rails.logger.debug "#{sent1.attributes.inspect}"
    # Rails.logger.debug "#{sent2.attributes.inspect}"
    # puts "#{sent1.attributes.inspect}"
    # puts "ORIGIN: #{sent1.origin && sent1.origin.attributes.inspect}"
    # puts "DESCENDANTS #{sent1.descendants.length}"
    # puts "#{sent2.attributes.inspect}"
    # puts "ORIGIN: #{sent2.origin && sent2.origin.attributes.inspect}"
    # puts "DESCENDANTS #{sent2.descendants.length}"
    
    assert_equal sent1.origin, sent2
    assert_equal sent1.descendants.count, 0
    assert_equal sent2.descendants.count, 1
    assert_equal sent2.descendants.first, sent1
  end
end
