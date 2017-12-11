# encoding: UTF-8
require 'solaar/table'
require 'solaar/exception'

module Solaar
  class Term
    attr_reader :solaar_terms

    def initialize
      @solaar_terms = Solaar::Table
    end

    def calc(*args)
      opts = args.last.is_a?(Hash) ? args.pop : {}
      opts.merge!(year: self.year) unless opts.key?(:year)

      if opts[:year].to_i > 2099 || opts[:year].to_i <= 0
        raise Exception::OutOfRange.new("Unable to calculate") 
      end

      if opts.key?(:month) && (1..12).map.include?(opts[:month].to_i)
        s = opts[:month].to_i*2-2
        solaar_terms(opts, [s, s+1])
      else
        solaar_terms(opts, nil)
      end

      @terms
    end

    def solaar_terms(opts={}, range=nil)
      @terms = []
      s, e = range.nil? ? [0,-1] : range
      
      if opts.key?(:term)
        @solaar_terms[s..e].each{ |t| @terms << formula(opts.merge!(t)) if opts[:term] == t[:ja] }
      else
        @solaar_terms[s..e].each{ |t| @terms << formula(opts.merge!(t)) }
      end
    end

    def formula(opts={})
      y = @year = opts[:year]
      month = opts.key?(:month) ? opts[:month].to_i : opts[:m]

      y = month <= 2 ? y - 1 : y
      day = opts[:day] + opts[:adj] * (y - 1900) - ((y - 1900) / 4)
      Hash[date: Time.new(@year, month, day).strftime("%F"), language: { ja: opts[:ja], en: opts[:en] }]
    end

    def year
      @year ||= Time.now.year
    end
  end
end
