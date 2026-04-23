module Muffon
  module Formatter
    module AlbumGroup
      class Base < Muffon::Formatter::Base
        include Muffon::Mixins::Album

        private

        def title
          @args[:title]
        end

        def source_data
          {
            name: source_name,
            id: source_album_group_id,
            model: source_model,
            links: source_links_data
          }.compact
        end

        def source_name
          @args[:source_name]
        end

        def source_album_group_id
          @args[:source_album_group_id]
        end

        def source_model
          @args[:source_model]
        end

        def source_streaming_link
          nil
        end

        def artists
          @args[:artists]
        end

        def image_data
          @args[:image_data]
        end

        def release_date
          @args[:release_date]
        end

        def tracks
          @args[:tracks]
        end

        def listeners_count
          album_record.listeners_count
        end

        def profiles_count
          album_record.profiles_count
        end
      end
    end
  end
end
