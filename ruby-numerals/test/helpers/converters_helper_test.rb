require 'test_helper'

class ConvertersHelperTest < ActionView::TestCase
	test 'humanize should convert' do		
		assert_equal 0.humanize, 'zero'
		assert_equal 1.humanize, 'one'
		assert_equal 10.humanize, 'ten'
		assert_equal 11.humanize, 'eleven'
		assert_equal 15.humanize, 'fifteen'
		assert_equal 20.humanize, 'twenty'
		assert_equal 100.humanize, 'one hundred'
		assert_equal 101.humanize, 'one hundred and one'
		assert_equal 112.humanize, 'one hundred and twelve'
		assert_equal 1000.humanize, 'one thousand'
		assert_equal 1001.humanize, 'one thousand and one'
		assert_equal 1099.humanize, 'one thousand and ninety-nine'
		assert_equal 1111.humanize, 'eleven hundred and eleven'
		assert_equal 1520.humanize, 'fifteen hundred and twenty'
		assert_equal 2010.humanize, 'two thousand and ten'
		assert_equal 10000.humanize, 'ten thousand'
		assert_equal 1234520.humanize, 'one million, two hundred and thirty-four thousand, five hundred and twenty'		
		assert_equal 100013.humanize, 'one hundred thousand and thirteen'
		assert_equal 10012002.humanize, 'ten million, twelve thousand and two'
		assert_equal 1234567.humanize, 'one million, two hundred and thirty-four thousand, five hundred and sixty-seven'
		assert_equal 102205.humanize, 'one hundred and two thousand, two hundred and five'
	end
end