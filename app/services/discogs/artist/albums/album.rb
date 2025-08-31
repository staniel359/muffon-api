module Discogs
  module Artist
    class Albums
      class Album < Discogs::Artist::Albums
        include Discogs::Utils::Album

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            album
          ]
        end

        def data
          self_data
            .merge(album_base_data)
            .merge(album_extra_data)
        end

        def title
          album['title']
        end

        def album
          @args[:album]
        end

        def album_base_data
          {
            source: source_data,
            title:,
            artist: artists_minimal_data,
            artists:
          }.compact
        end

        def discogs_id
          album['id']
        end

        def discogs_model
          group? ? 'group' : 'album'
        end

        def group?
          group_id.present?
        end

        def group_id
          album['main_release']
        end

        def artists_list
          [{ 'name' => album['artist'] }]
        end

        def album_extra_data
          {
            image: image_data,
            release_date:,
            listeners_count:
          }.compact
        end

        def image
          album['thumb']
        end

        def release_date
          album['year']
        end
      end
    end
  end
end
