class Album < ApplicationRecord
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

  has_many :library_albums, dependent: nil

  has_many :profiles,
           -> { distinct },
           through: :library_albums,
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
            artist_id:,
            title: title_formatted
          )
      end
    end

    def associated
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
  end

  def source_data
    {
      name: 'lastfm',
      links: source_links_data
    }
  end

  def image_data
    LastFM::Formatter::Image.call(
      image_url:
    )
  end

  private

  def handle_after_create_commit
    update_tags unless test?
  end

  def update_tags
    Muffon::Worker::Album::Tags::Updater.call(
      artist_name: artist.name,
      album_title: title
    )
  end

  def source_links_data
    { original: source_original_link }
  end

  def source_original_link
    "https://www.last.fm/music/#{CGI.escape(artist.name)}/#{CGI.escape(title)}"
  end
end
