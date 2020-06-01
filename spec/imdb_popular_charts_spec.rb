require './lib/imdb_popular_charts'
describe Charts do
  chart = Charts.new
  describe '#chart_data' do
    it 'return hash containing most POPULAR MOVIES' do
      rank = 8
      title = 'Ready or Not'
      imdb_rating = 6.8
      release_year = 2019

      current = [title.downcase, imdb_rating.to_s, "(#{release_year})"]
      dict_data = chart.chart_data(chart.popular_mv)
      selected = dict_data[rank]
      expect(selected).to eql(current)
    end

    it 'return hash containing most POPULAR TV SHOWS' do
      rank = 2
      title = 'snowpiercer'
      imdb_rating = 6.2
      release_year = 2020

      current = [title.downcase, imdb_rating.to_s, "(#{release_year})"]
      dict_data = chart.chart_data(chart.popular_tv_show)
      selected = dict_data[rank]
      expect(selected).to eql(current)
    end
  end
end
