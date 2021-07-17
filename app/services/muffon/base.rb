module Muffon
  class Base
    ERRORS = Muffon::Utils::Errors

    class << self
      def call(args = {})
        new(args).call
      rescue *ERRORS.list => e
        ERRORS.handle(e.class)
      end
    end

    def initialize(args = {})
      @args = OpenStruct.new(args)
    end

    def call
      return bad_request if not_all_args?
      return not_found if no_data?

      data
    end

    private

    def secrets
      Rails.application.credentials
    end

    def not_all_args?
      primary_args.any?(&:blank?)
    end

    def not_found
      ERRORS.handlers[:not_found]
    end

    def bad_request
      ERRORS.handlers[:bad_request]
    end

    def forbidden
      ERRORS.handlers[:forbidden]
    end

    def date_formatted(data)
      Muffon::Utils::Date.format(data)
    end

    def duration_formatted(data)
      Muffon::Utils::Duration.format(data)
    end

    def description_truncated
      description.truncate(400)
    end

    def default_image_data(model)
      LastFM::Utils::Image.call(model: model)
    end

    def player_id
      ::Track.with_artist_title(
        artist_formatted[:name], title
      ).player_id
    end

    def artist_formatted
      { name: artist_names }
    end

    def artist_names
      artists.pluck(:name).join(', ')
    end

    def album_formatted
      return {} if albums.blank?

      { title: album_title }
    end

    def album_title
      albums.dig(0, :title)
    end

    def tags
      tags_list.map do |t|
        tag_data_formatted(t)
      end
    end

    def tag_data_formatted(tag)
      { name: tag_name_formatted(tag) }
    end

    def tag_name_formatted(tag)
      case tag.class.name
      when 'String'
        tag
      when 'Hash'
        tag['name'] || tag['label']
      when 'Nokogiri::XML::Element'
        tag.text
      end
    end

    def with_more_data
      {
        with_more: {
          description: with_more_description?,
          tags: with_more_tags?
        }.compact
      }
    end

    def with_more_description?
      defined?(description) &&
        description.size >
          description_truncated.size
    end

    def with_more_tags?
      defined?(tags_list) && tags_list.size > 5
    end
  end
end
