require './lib/imdb_popular_charts'
describe Charts do
  movie_rank = 8
  movie_title = 'Ready or Not'
  movie_imdb_rating = 6.8
  movie_release_year = 2019

  tv_rank = 2
  tv_title = 'snowpiercer'
  tv_imdb_rating = 6.2
  tv_release_year = 2020

  chart = Charts.new
  describe '#chart_data' do
    it 'return hash containing most POPULAR MOVIES' do
      current = [movie_title.downcase, movie_imdb_rating.to_s, "(#{movie_release_year})"]
      dict_data = chart.chart_data(chart.popular_mv)
      selected = dict_data[movie_rank]
      expect(selected).to eql(current)
    end

    it 'return hash containing most POPULAR TV SHOWS' do
      current = [tv_title.downcase, tv_imdb_rating.to_s, "(#{tv_release_year})"]
      dict_data = chart.chart_data(chart.popular_tv_show)
      selected = dict_data[tv_rank]
      expect(selected).to eql(current)
    end
  end
end
