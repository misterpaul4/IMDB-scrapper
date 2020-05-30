require 'nokogiri'
require 'open-uri'

class SiteObj
  attr_accessor :site

  def initialize(site)
    @site = site
  end

  def site_obj
    Nokogiri::HTML.parse(open(site))
  end

  def css_selector(selector)
    site_obj.css(selector)
  end
end
