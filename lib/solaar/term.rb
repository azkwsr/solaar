# encoding: UTF-8

module Solaar
  Table = TABLE = [
      {m: 1,  day: 6.3811,  adj: 0.242778, ja: '小寒', en: 'Minor cold'},
      {m: 1,  day: 21.1046, adj: 0.242765, ja: '大寒', en: 'Major cold'},
      {m: 2,  day: 4.8693,  adj: 0.242713, ja: '立春', en: 'Start of spring'},
      {m: 2,  day: 19.7062, adj: 0.242627, ja: '雨水', en: 'Rain water'},
      {m: 3,  day: 6.3968,  adj: 0.242512, ja: '啓蟄', en: 'Awakening of insects'},
      {m: 3,  day: 21.4471, adj: 0.242377, ja: '春分', en: 'Vernal equinox'},
      {m: 4,  day: 5.628,   adj: 0.242231, ja: '清明', en: 'Clear and bright'},
      {m: 4,  day: 20.9375, adj: 0.242083, ja: '穀雨', en: 'Grain rainain'},
      {m: 5,  day: 6.3771,  adj: 0.241945, ja: '立夏', en: 'Start of summer'},
      {m: 5,  day: 21.93,   adj: 0.241825, ja: '小満', en: 'Grain full'},
      {m: 6,  day: 6.5733,  adj: 0.241731, ja: '芒種', en: 'Grain in ear'},
      {m: 6,  day: 22.2747, adj: 0.241669, ja: '夏至', en: 'Summer solstice'},
      {m: 7,  day: 8.0091,  adj: 0.241642, ja: '小暑', en: 'Minor heat'},
      {m: 7,  day: 23.7317, adj: 0.241654, ja: '大暑', en: 'Major heat'},
      {m: 8,  day: 8.4102,  adj: 0.241703, ja: '立秋', en: 'Start of autumn'},
      {m: 8,  day: 24.0125, adj: 0.241786, ja: '処暑', en: 'Limit of heat'},
      {m: 9,  day: 8.5186,  adj: 0.241898, ja: '白露', en: 'White dew'},
      {m: 9,  day: 23.8896, adj: 0.242032, ja: '秋分', en: 'Autumnal equinox'},
      {m: 10, day: 9.1414,  adj: 0.242179, ja: '寒露', en: 'Cold dew'},
      {m: 10, day: 24.2487, adj: 0.242328, ja: '霜降', en: 'Frost descent'},
      {m: 11, day: 8.2396,  adj: 0.242469, ja: '立冬', en: 'Start of winter'},
      {m: 11, day: 23.1189, adj: 0.242592, ja: '小雪', en: 'Minor snow'},
      {m: 12, day: 7.9152,  adj: 0.242689, ja: '大雪', en: 'Major snow'},
      {m: 12, day: 22.6587, adj: 0.242752, ja: '冬至', en: 'Winter solstice'}
  ]

  class Exception
    class Error < StandardError ; end
    class OutOfRange < Error ; end
  end

  class Term
    def initialize
      @solaarterms = Solaar::Table
    end

    def calc(*args)
      opts = args.last.is_a?(Hash) ? args.pop : {}
      opts.merge!(year: self.year) if !opts.key?(:year)

      if opts[:year].to_i > 2099 || opts[:year].to_i <= 0
        raise Exception::OutOfRange.new("Unable to calculate") 
      end

      if opts.key?(:month) && (1..12).map.include?(opts[:month].to_i)
        s = opts[:month].to_i*2-2
        self.solaarterms(opts, [s, s+1])
      else
        self.solaarterms(opts, nil)
      end

      @terms
    end

    def solaarterms(opts={}, range=nil)
      @terms = []
      s, e = range.nil? ? [0,-1] : range
      if opts.key?(:term)
        @solaarterms[s..e].each{ |t| @terms << self.formula(opts.merge!(t)) if opts[:term] == t[:ja] }
      else
        @solaarterms[s..e].each{ |t| @terms << self.formula(opts.merge!(t)) }
      end
    end

    def formula(opts={})
      y = @year = opts[:year]
      month = opts.key?(:month) ? opts[:month].to_i : opts[:m]

      y = month <= 2 ? y - 1 : y
      day = opts[:day] + opts[:adj] * (y - 1900) - ((y - 1900) / 4)
      Hash[date: Time.new(@year, month, day).strftime("%F"), ja: opts[:ja], en: opts[:en]]
    end

    def year
      @year ||= Time.now.year
    end
  end
end
