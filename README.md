Solaar
==========

A Ruby gem to calculate the 24 solar terms ("24節気" in Japanese) until 2099.

Installation
-------------
    gem install solaar


Usage
---------
    require 'solaar'
    require 'pp'

    solaar = Solaar::Term.new

    pp solaar.calc(year: 2012)
    #=> [{:date=>"2012-01-06", :ja=>"小寒", :en=>"Minor cold"},
        {:date=>"2012-01-21", :ja=>"大寒", :en=>"Major cold"},
        {:date=>"2012-02-04", :ja=>"立春", :en=>"Start of spring"},
        {:date=>"2012-02-19", :ja=>"雨水", :en=>"Rain water"},
        {:date=>"2012-03-05", :ja=>"啓蟄", :en=>"Awakening of insects"},
        {:date=>"2012-03-20", :ja=>"春分", :en=>"Vernal equinox"},
        {:date=>"2012-04-04", :ja=>"清明", :en=>"Clear and bright"},
        {:date=>"2012-04-20", :ja=>"穀雨", :en=>"Grain rainain"},
        {:date=>"2012-05-05", :ja=>"立夏", :en=>"Start of summer"},
        {:date=>"2012-05-21", :ja=>"小満", :en=>"Grain full"},
        {:date=>"2012-06-05", :ja=>"芒種", :en=>"Grain in ear"},
        {:date=>"2012-06-21", :ja=>"夏至", :en=>"Summer solstice"},
        {:date=>"2012-07-07", :ja=>"小暑", :en=>"Minor heat"},
        {:date=>"2012-07-22", :ja=>"大暑", :en=>"Major heat"},
        {:date=>"2012-08-07", :ja=>"立秋", :en=>"Start of autumn"},
        {:date=>"2012-08-23", :ja=>"処暑", :en=>"Limit of heat"},
        {:date=>"2012-09-07", :ja=>"白露", :en=>"White dew"},
        {:date=>"2012-09-22", :ja=>"秋分", :en=>"Autumnal equinox"},
        {:date=>"2012-10-08", :ja=>"寒露", :en=>"Cold dew"},
        {:date=>"2012-10-23", :ja=>"霜降", :en=>"Frost descent"},
        {:date=>"2012-11-07", :ja=>"立冬", :en=>"Start of winter"},
        {:date=>"2012-11-22", :ja=>"小雪", :en=>"Minor snow"},
        {:date=>"2012-12-07", :ja=>"大雪", :en=>"Major  snow"},
        {:date=>"2012-12-21", :ja=>"冬至", :en=>"Winter solstice"}]

    pp solaar.calc(year: 2012, month: 3)
    #=> [{:date=>"2012-03-05", :ja=>"啓蟄", :en=>"Awakening of insects"},
        {:date=>"2012-03-20", :ja=>"春分", :en=>"Vernal equinox"}]

    pp solaar.calc(year: 2015, month: 3)
    #=> [{:date=>"2015-03-06", :ja=>"啓蟄", :en=>"Awakening of insects"},
        {:date=>"2015-03-21", :ja=>"春分", :en=>"Vernal equinox"}]

    pp solaar.calc(year: 2012, term: "春分")
    #=> [{:date=>"2012-03-20", :ja=>"春分", :en=>"Vernal equinox"}]

    pp solaar.calc(year: 2100)
    #=> "Unable to calculate with the given year"


Author
---------

azukiwasher, http://twitter.com/azukiwasher, azukiwasher AT higanworks.com

Copyright
----------

Copyright (c) 2012 azukiwasher. See LICENSE for details.
