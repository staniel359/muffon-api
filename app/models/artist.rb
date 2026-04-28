class Artist < ApplicationRecord
  ORDERS = %w[
    listeners_count_desc
    listeners_count_asc
  ].freeze

  validates :name, presence: true

  validates :name_downcase,
            presence: true,
            uniqueness: true

  has_many :library_artists, dependent: nil

  has_many :listened_artists, dependent: nil

  has_many :profiles,
           through: :library_artists,
           dependent: nil

  after_create_commit :handle_after_create_commit

  class << self
    def with_name(
      name
    )
      with_cache_clearance_and_retry_on_error do
        name_formatted =
          name
          .strip
          .truncate(
            1_000
          )

        where(
          name_downcase:
            name_formatted.downcase
        )
          .first_or_create!(
            name: name_formatted
          )
      end
    end

    def with_names(
      names
    )
      names_formatted =
        names.map do |name|
          name
            .strip
            .downcase
        end

      where(
        name_downcase: names_formatted
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

  def image_data
    LastFM::Formatter::Image.call(
      image_url:
    )
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
    Muffon::Worker::Artist::Tags::Updater.call(
      artist_name: name
    )
  end

  def source_links_data
    { original: source_original_link }
  end

  def source_original_link
    "https://www.last.fm/music/#{CGI.escape(name)}"
  end
end
