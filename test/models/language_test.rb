require "test_helper"

class LanguageTest < ActiveSupport::TestCase
  test "languages count" do
    assert_equal 2, Language.count    
  end
  test "check fixture" do
    assert_equal "pt_BR", languages(:pt_BR).code
  end
end
