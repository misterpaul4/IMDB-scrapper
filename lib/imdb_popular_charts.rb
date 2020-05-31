require_relative '../lib/site_obj.rb'
class Charts
  def initialize
    @title_selector = '.lister .titleColumn a'
    @rating_selector = '.lister .imdbRating'
    @release_date_raw = '.lister-list tr .titleColumn'
  end

  def popular_mv_scrap
    link = SiteObj.new('https://www.imdb.com/chart/moviemeter/?ref_=nv_mv_mpm')
    [link.selector(@title_selector), link.selector(@rating_selector), extract_date(link.selector(@release_date_raw))]
  end

  def popular_tv_show_scrap
    link = SiteObj.new('https://www.imdb.com/chart/tvmeter/?ref_=nv_tvv_mptv')
    [link.selector(@title_selector), link.selector(@rating_selector), extract_date(link.selector(@release_date_raw))]
  end

  def extract_date(nk_obj)
    dates = []
    nk_obj.each do |item|
      dates.push(/\(\d\d\d\d\)/.match(item.text.to_s.strip).to_s)
    end
    dates
  end

  def chart_data(lists)
    dict = {}
    index = 1
    movie_titles = lists[0]
    movie_ratings = lists[1]
    movie_release_dates = lists[2]
    movie_titles.each do |movie|
      dict[index] = [movie.text, movie_ratings[index - 1].text.strip, movie_release_dates[index - 1]]
      index += 1
    end
    dict # hash containing index as keys, movie title, ratings and year as values
  end
end
