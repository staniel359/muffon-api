ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'API'
  inflect.acronym 'LastFM'
  inflect.acronym 'VK'
  inflect.acronym 'YouTube'
  inflect.acronym 'SoundCloud'
  inflect.acronym 'RateYourMusic'
  inflect.acronym 'YandexMusic'

  inflect.uncountable %w[discogs genius]
end
