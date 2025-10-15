ENV['RAILS_ENV'] ||= 'test'

require File.expand_path(
  '../config/environment',
  __dir__
)

require 'rspec/rails'
require 'vcr'
require 'vcr_helper'

Dir[
  Rails.root.join(
    'spec/helpers/**/*.rb'
  )
].each do |file|
  require file
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => error
  puts error.to_s.strip

  exit 1
end

RSpec.configure do |config|
  config.include Spec::Helpers::Base

  config.include Spec::Helpers::Search

  config.include Spec::Helpers::AmazonMusic::Album
  config.include Spec::Helpers::AmazonMusic::Artist
  config.include Spec::Helpers::AmazonMusic::Search
  config.include Spec::Helpers::AmazonMusic::Track
  config.include Spec::Helpers::AmazonMusic::Utils

  config.include Spec::Helpers::Bandcamp::Album
  config.include Spec::Helpers::Bandcamp::Artist
  config.include Spec::Helpers::Bandcamp::Label
  config.include Spec::Helpers::Bandcamp::Search
  config.include Spec::Helpers::Bandcamp::Track

  config.include Spec::Helpers::Deezer::Album
  config.include Spec::Helpers::Deezer::Artist
  config.include Spec::Helpers::Deezer::Search
  config.include Spec::Helpers::Deezer::Track
  config.include Spec::Helpers::Deezer::Utils

  config.include Spec::Helpers::Discogs::Album
  config.include Spec::Helpers::Discogs::Artist
  config.include Spec::Helpers::Discogs::Group
  config.include Spec::Helpers::Discogs::Label
  config.include Spec::Helpers::Discogs::Search

  config.include Spec::Helpers::Genius::Album
  config.include Spec::Helpers::Genius::Annotation
  config.include Spec::Helpers::Genius::Artist
  config.include Spec::Helpers::Genius::Search
  config.include Spec::Helpers::Genius::Track

  config.include Spec::Helpers::LastFM::Album
  config.include Spec::Helpers::LastFM::Artist
  config.include Spec::Helpers::LastFM::Multitag
  config.include Spec::Helpers::LastFM::Releases
  config.include Spec::Helpers::LastFM::Search
  config.include Spec::Helpers::LastFM::Tag
  config.include Spec::Helpers::LastFM::Top
  config.include Spec::Helpers::LastFM::Track
  config.include Spec::Helpers::LastFM::User
  config.include Spec::Helpers::LastFM::User::Favorites
  config.include Spec::Helpers::LastFM::User::Playlist

  config.include Spec::Helpers::Muffon::Radio::Artist
  config.include Spec::Helpers::Muffon::Radio::Tag
  config.include Spec::Helpers::Muffon::Radio::Top

  config.include Spec::Helpers::MusicBrainz::Album
  config.include Spec::Helpers::MusicBrainz::Artist
  config.include Spec::Helpers::MusicBrainz::Group
  config.include Spec::Helpers::MusicBrainz::Search
  config.include Spec::Helpers::MusicBrainz::Track

  config.include Spec::Helpers::MusixMatch::Album
  config.include Spec::Helpers::MusixMatch::Artist
  config.include Spec::Helpers::MusixMatch::Search
  config.include Spec::Helpers::MusixMatch::Track

  config.include Spec::Helpers::Odnoklassniki::Album
  config.include Spec::Helpers::Odnoklassniki::Artist
  config.include Spec::Helpers::Odnoklassniki::Search
  config.include Spec::Helpers::Odnoklassniki::Track
  config.include Spec::Helpers::Odnoklassniki::Utils

  config.include Spec::Helpers::SoundCloud::Album
  config.include Spec::Helpers::SoundCloud::Artist
  config.include Spec::Helpers::SoundCloud::Search
  config.include Spec::Helpers::SoundCloud::Track
  config.include Spec::Helpers::SoundCloud::Utils

  config.include Spec::Helpers::Spotify::Album
  config.include Spec::Helpers::Spotify::Artist
  config.include Spec::Helpers::Spotify::Playlist
  config.include Spec::Helpers::Spotify::Search
  config.include Spec::Helpers::Spotify::Track
  config.include Spec::Helpers::Spotify::User
  config.include Spec::Helpers::Spotify::Utils

  config.include Spec::Helpers::VK::Album
  config.include Spec::Helpers::VK::Artist
  config.include Spec::Helpers::VK::Search
  config.include Spec::Helpers::VK::Track

  config.include Spec::Helpers::YandexMusic::Album
  config.include Spec::Helpers::YandexMusic::Artist
  config.include Spec::Helpers::YandexMusic::Search
  config.include Spec::Helpers::YandexMusic::Track

  config.include Spec::Helpers::YouTube::Base
  config.include Spec::Helpers::YouTube::Channel
  config.include Spec::Helpers::YouTube::Playlist
  config.include Spec::Helpers::YouTube::Search
  config.include Spec::Helpers::YouTube::Video

  config.include Spec::Helpers::YouTubeMusic::Album
  config.include Spec::Helpers::YouTubeMusic::Search
  config.include Spec::Helpers::YouTubeMusic::Track

  config.filter_rails_from_backtrace!

  config.infer_spec_type_from_file_location!
end
