# -*- encoding: UTF-8 -*-
require 'helper'

class TestSolaar < Test::Unit::TestCase

  context "a solaar" do
    setup do
      @solaar = Solaar::Terms.new
    end

    should "not calculate with give year" do
      assert_equal "Unable to calculate with given year", @solaar.calc(year: 2100)
    end

    should "calculate a date with a year and a month" do
      assert_equal "2012-03-05", @solaar.calc(year: 2012, month: 3).first[:date]
      assert_equal "啓蟄", @solaar.calc(year: 2012, month: 3).first[:ja]
      assert_equal "Awakening of insects", @solaar.calc(year: 2012, month: 3).first[:en]
      assert_equal "2012-03-20", @solaar.calc(year: 2012, month: 3).last[:date]
      assert_equal "春分", @solaar.calc(year: 2012, month: 3).last[:ja]
      assert_equal "Vernal equinox", @solaar.calc(year: 2012, month: 3).last[:en]
    end

    should "calculate all dates for the given year" do
      assert_equal 24, @solaar.calc(year: 2015).size
      assert_equal "2015-01-06", @solaar.calc(year: 2015).first[:date]
      assert_equal "小寒", @solaar.calc(year: 2015).first[:ja]
      assert_equal "Minor cold", @solaar.calc(year: 2015).first[:en]
      assert_equal "2015-12-22", @solaar.calc(year: 2015).last[:date]
      assert_equal "冬至", @solaar.calc(year: 2015).last[:ja]
      assert_equal "Winter solstice", @solaar.calc(year: 2015).last[:en]
    end

    should "calculate all dates for this year without year parameter" do
      assert_equal 24, @solaar.calc.size
      assert_equal "#{Time.now.year}", @solaar.calc.first[:date].split(/-/).first
      assert_equal "#{Time.now.year}", @solaar.calc.first[:date].split(/-/).first
    end

    should "calculate all dates for the year and given month without year parameter" do
      assert_equal 2, @solaar.calc(month: 3).size
      assert_equal "#{Time.now.year}", @solaar.calc(month: 3).first[:date].split(/-/).first
      assert_equal "#{Time.now.year}", @solaar.calc(month: 3).last[:date].split(/-/).first
    end

    should "calculate all dates for the year and given term without year parameter" do
      assert_equal 1, @solaar.calc(term: '春分').size
      assert_equal "#{Time.now.year}", @solaar.calc(term: "春分").first[:date].split(/-/).first
      assert_equal "春分", @solaar.calc(term: "春分").last[:ja]
      assert_equal "Vernal equinox", @solaar.calc(term: "春分").last[:en]
    end

    should "calculate all dates for the year and given term with a year parameter" do
      assert_equal 1, @solaar.calc(year: 2015, term: '春分').size
      assert_equal "2015", @solaar.calc(term: "春分").first[:date].split(/-/).first
      assert_equal "春分", @solaar.calc(term: "春分").last[:ja]
      assert_equal "Vernal equinox", @solaar.calc(term: "春分").last[:en]
    end
  end
end
