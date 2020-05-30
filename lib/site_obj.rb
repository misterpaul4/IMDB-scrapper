require 'nokogiri'
require 'httparty'

class SiteObj
  attr_accessor :site

  def initialize(site)
    @site = site
  end

  def site_obj
    response = HTTParty.get(site)
    Nokogiri::HTML.parse(response.body)
  end

  def css_selector(selector)
    site_obj.css(selector)
  end
end
