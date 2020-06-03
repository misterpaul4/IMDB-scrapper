require 'nokogiri'
require 'httparty'

class SiteObj
  attr_reader :site

  def initialize(site)
    @site = site
  end

  def selector(css_selector)
    site_obj.css(css_selector)
  end

  private

  def site_obj
    response = HTTParty.get(site)
    Nokogiri::HTML.parse(response.body)
  end
end
