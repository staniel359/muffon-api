module Muffon
  module Formatter
    module Source
      module Album
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::Album

          private

          def title
            @args[:title]
          end

          def source_data
            {
              name: source_name,
              id: source_album_id,
              slug: source_album_slug,
              artist_id: source_album_artist_id,
              owner_id: source_album_owner_id,
              access_key: source_album_access_key,
              model: source_model,
              links: source_links_data
            }.compact
          end

          def source_name
            @args[:source_name]
          end

          def source_album_id
            @args[:source_album_id]
          end

          def source_album_slug
            @args[:source_album_slug]
          end

          def source_album_artist_id
            @args[:source_album_artist_id]
          end

          def source_album_owner_id
            @args[:source_album_owner_id]
          end

          def source_album_access_key
            @args[:source_album_access_key]
          end

          def source_model
            @args[:source_model]
          end

          def source_streaming_link
            Muffon::Formatter::Source::StreamingLink.call(
              model: 'album',
              source_name:,
              source_model_id: source_album_id
            )
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

          def with_listeners_count?
            @args[:is_with_listeners_count]
          end

          def listeners_count
            album_record.listeners_count
          end

          def plays_count
            @args[:plays_count]
          end

          def profiles_count
            album_record.profiles_count
          end

          def labels
            @args[:labels]
          end

          def tracks
            @args[:tracks]
          end
        end
      end
    end
  end
end
