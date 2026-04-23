module Muffon
  module Formatter
    module Artist
      class Base < Muffon::Formatter::Base
        include Muffon::Utils::Artist

        private

        def name
          @args[:name]
        end

        def source_data
          {
            name: source_name,
            id: source_artist_id,
            slug: source_artist_slug,
            model: source_model,
            links: source_links_data
          }.compact
        end

        def source_name
          @args[:source_name]
        end

        def source_artist_id
          @args[:source_artist_id]
        end

        def source_artist_slug
          @args[:source_artist_slug]
        end

        def source_model
          @args[:source_model]
        end

        def source_streaming_link
          nil
        end

        def image_data
          @args[:image_data]
        end

        def listeners_count
          artist_record.listeners_count
        end

        def plays_count
          @args[:plays_count]
        end

        def profiles_count
          artist_record.profiles_count
        end

        def recommendation_data
          @args[:recommendation_data]
        end
      end
    end
  end
end
