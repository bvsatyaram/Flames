require 'test_helper'

class FlamesTest < Test::Unit::TestCase
  load_schema

  class Flame < ActiveRecord::Base
  end

  def test_schema_has_loaded_correctly
    assert_equal [], Flame.all
  end

end
