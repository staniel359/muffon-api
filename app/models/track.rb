class Track < ApplicationRecord
  ORDERS = %w[
    listeners_count_desc
    listeners_count_asc
  ].freeze

  validates :title, presence: true

  validates :title_downcase,
            presence: true,
            uniqueness: {
              scope: :artist_id
            }

  validates :player_id,
            presence: true,
            uniqueness: true,
            unless: -> { test? }

  has_many :library_tracks, dependent: nil

  has_many :listened_tracks, dependent: nil

  has_many :profiles,
           -> { distinct },
           through: :library_tracks,
           dependent: nil

  belongs_to :artist

  after_create_commit :handle_after_create_commit

  class << self
    def with_artist_title(
      artist_id:,
      title:
    )
      with_cache_clearance_and_retry_on_error do
        title_formatted =
          title
          .strip
          .truncate(
            1_000
          )

        where(
          artist_id:,
          title_downcase:
            title_formatted.downcase
        )
          .first_or_create!(
            title: title_formatted,
            player_id:
          )
      end
    end

    def with_relations
      includes(
        :artist
      )
    end

    def listeners_count_desc_ordered
      order(
        listeners_count: :desc
      )
    end

    def listeners_count_asc_ordered
      order(
        listeners_count: :asc
      )
    end

    private

    def player_id
      return if test?

      SecureRandom.uuid
    end
  end

  def source_data
    {
      name: 'lastfm',
      links: source_links_data
    }
  end

  private

  def handle_after_create_commit
    update_tags unless test?
  end

  def update_tags
    Muffon::Worker::Track::Tags::Updater.call(
      artist_name: artist.name,
      track_title: title
    )
  end

  def source_links_data
    { original: source_original_link }
  end

  def source_original_link
    "https://www.last.fm/music/#{CGI.escape(artist.name)}/_/#{CGI.escape(title)}"
  end
end
