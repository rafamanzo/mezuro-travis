require File.dirname(__FILE__) + '/../test_helper'

# tests for String core extension. See lib/noosfero/core_ext/string.rb
class StringCoreExtTest < Test::Unit::TestCase

  # tests for String#to_slug
  should 'keep only alphanum' do
    assert_equal 'abc', 'abc!)@(*#&@!*#*)'.to_slug
  end

  should 'turn punctuation into dashes' do
    assert_equal 'a-b-c-d-e-f', 'a:b;c+d=e_f'.to_slug
  end

  should 'truncate dashes' do
    assert_equal 'a-b-c', 'a---b: c ;;;'.to_slug
  end

  should 'turn spaces into dashes' do
    assert_equal 'a-b', 'a b'.to_slug
  end

  should 'not remove dots' do
    assert_equal 'a.b', 'a.b'.to_slug
  end

  # tests for String#transliterate
  should 'transliterate' do
    assert_equal 'eeeeEEOOoocaaaiIIiuuyYnN', 'éèëêÊËÖÔöôçäàâîÏÎïûüÿŸñÑ'.transliterate
  end

end