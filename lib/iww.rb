# frozen_string_literal: true

require_relative "iww/version"

module Iww
  class Error < StandardError; end

  @@LOGO = {
    white: %[https://www.iww.org/images/globe.svg],
    red: %[https://www.iww.org/images/iww-globe-red.svg],
    seal: %[https://www.iww.org/images/entitled-iww-logo-white.svg]
  }

  def self.image
    @@LOGO
  end

  def self.join!
    %[https://redcard.iww.org/user/register]
  end

  @@OLD = [
    %[The working class and the employing class have nothing in common.],
    %[There can be no peace so long as hunger and want are found among millions of the working people and the few, who make up the employing class, have all the good things of life.],               
    %[Between these two classes a struggle must go on until the workers of the world organise as a class, take possession of the means of production, abolish the wage system, and live in harmony with the earth.],
    %[We find that the centering of the management of industries into fewer and fewer hands makes the trade unions unable to cope with the evergrowing power of the employing class. The trade unions foster a state of affairs which allows one set of workers to be pitted against another set of workers in the same industry, thereby helping defeat one another in wage wars. Moreover, the trade unions aid the employing class to mislead the workers into the belief that the working class have interests in common with their employers.],
    %[These conditions can be changed and the interest of the working class upheld only by an organization formed in such a way that all its members in any one industry, or in all industries if necessary, cease work whenever a strike or lockout is on in any department thereof, thus making an injury to one an injury to all.],
    %[Instead of the conservative motto, ‘’A fair day’s wage for a fair day’s work,” we must inscribe on our banner the revolutionary watchword, ‘’Abolition of the wage system.”],
    %[It is the historic mission of the working class to do away with capitalism. The army of prod uction must be organised, not only for everyday struggle with capitalists, but also to carry on production when capitalism shall have been overthrown. By organizing industrially we are forming the structure of the new society within the shell of the old.],
    %[Knowing, therefore, that such an organization is absolutely necessary for emancipation, we unite under the following set of guiding principles and rules:]
  ]
  
  def self.preamble
    @@OLD
  end

  @@DIV = {
    "110" => "Agricultural",
    "120" => "Lumber",
    "130" => "Fishery",
    "140" => "Greenhouse",
    "210" => "Mining",
    "220" => "Energy",
    "310" => "Civil Construction",
    "330" => "Ship and Boat Builders",
    "340" => "Building Maintenance and Landscaping",
    "410" => "Textile and Leather",
    "420" => "Wood Processing and Furniture",
    "430" => "Chemical",
    "450" => "Printing and Publishing",
    "460" => "Food Product",
    "470" => "Electronics and Instrument",
    "480" => "Glass, Pottery, and Mineral",
    "490" => "Pulp and Paper Mill",
    "510" => "Marine",
    "520" => "Railroad",
    "530" => "Ground Transportation and Transit",
    "540" => "Postal Express and Message Delivery",
    "550" => "Air Transport",
    "560" => "General Distribution",
    "570" => "Communications and Internet Technology",
    "580" => "Information Service",
    "590" => "Video, Audio, and Film Production",
    "610" => "Health Services",
    "613" => "Incarcerated",
    "620" => "Education and Research",
    "630" => "Performing arts, Recreation, and Tourism",
    "631" => "Freelance and Temporary",
    "640" => "Food and Retail Workers",
    "650" => "Financial Office",
    "651" => "Government",
    "660" => "Retail",
    "670" => "Utility and Sanitation",
    "690" => "Sex Industry"
  }

  def self.divisions
    @@DIV
  end
  
  @@MAP = {
    "uber" => ["631"],
    "driver" => ["530","540","631"],
    "pedicabber" => ["530"],
    "courier" => ["540"],
    "dancer" => ["630","690"],
    "entertainer" => ["630","690"],
    "onlyfans" => ["630","690"],
    "farmer" => ["110"],
    "artist" => ["631"],
    "cook" => ["460","640"],
    "chef" => ["640"],
    "bartender" => ["640"],
    "barista" => ["640"],
    "writer" => ["450"],
    "fisherman" => ["130"],
    "landscaper" => ["340"],
    "pilot" => ["550"],
    "sailor" => ["510"],
    "construction" => ["310"],
    "accountant" => ["650"],
    "nurse" => ["610"],
    "orderly" => ["610"],
    "doctor" => ["610"],
    "busser" => ["670"],
    "musician" => ["630"],
    "performer" => ["630"],
    "character" => ["630"],
    "producer" => ["590"],
    "sales" => ["660"],
    "fundraiser" => ["580"],
    "influencer" => ["580"],
    "programmer" => ["570"],
    "developer" => ["570"],
    "teacher" => ["620"],
    "clerk" => ["660"],
    "budtender" => ["660"]
  }

  def self.jobs
     [ @@MAP.keys, @@DIV.values ].flatten
  end
  
  def self.job k, j
    if !@@MAP.has_key? k.to_s
      @@MAP[k.to_s] = []
    end
    @@MAP[k.to_s] << j
  end
  
  def self.[] x
    if @@MAP.has_key? x.to_s
      o = {}
      @@MAP[x.to_s].each { |e| o[e] = @@DIV[e] }
      return o
    elsif @@DIV.has_key? x.to_s
      return { x.to_s => @@DIV[x.to_s] }
    elsif @@DIV.has_value? x.to_s.capitalize
      xx = @@DIV.key(x.to_s.capitalize)
      return { xx => x.to_s.capitalize }
    else
      return false
    end
  end  
end
