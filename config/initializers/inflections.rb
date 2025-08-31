ACRONYMS = %w[
  API
  LastFM
  VK
  YouTubeMusic
  YouTube
  SoundCloud
  YandexMusic
  MusicBrainz
  MusixMatch
  GitHub
  AmazonMusic
].freeze
UNCOUNTABLES = %w[
  discogs
  genius
].freeze

ActiveSupport::Inflector.inflections(:en) do |inflect|
  ACRONYMS.each do |acronym|
    inflect.acronym(
      acronym
    )
  end

  inflect.uncountable(
    UNCOUNTABLES
  )
end
