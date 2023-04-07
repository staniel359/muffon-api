ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'API'
  inflect.acronym 'LastFM'
  inflect.acronym 'VK'
  inflect.acronym 'YouTubeMusic'
  inflect.acronym 'YouTube'
  inflect.acronym 'SoundCloud'
  inflect.acronym 'YandexMusic'
  inflect.acronym 'MusicBrainz'

  inflect.uncountable %w[discogs genius]
end
