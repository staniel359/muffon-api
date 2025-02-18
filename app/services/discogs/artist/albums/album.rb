module Discogs
  module Artist
    class Albums
      class Album < Discogs::Artist::Albums
        include Discogs::Utils::Album

        def call
          data
        end

        private

        def data
          self_data
            .merge(album_base_data)
            .merge(album_extra_data)
        end

        def title
          album['title']
        end

        def album
          # @args[:album]['keyRelease']
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
          # (group || album)['discogsId']
          album['id']
        end

        # def group
        #   album['masterRelease']
        # end

        def discogs_model
          group? ? 'group' : 'album'
        end

        def group?
          # group.present?
          group_id.present?
        end

        def group_id
          album['main_release']
        end

        def artists_list
          # album['primaryArtists']
          [{ 'name' => album['artist'] }]
        end

        # def artist_data_formatted(artist)
        #   {
        #     source: artist_source_data(
        #       artist
        #     ),
        #     name: artist.dig(
        #       'artist', 'name'
        #     )
        #   }
        # end

        # def artist_source_data(artist)
        #   {
        #     name: source_name,
        #     id: artist.dig(
        #       'artist', 'discogsId'
        #     )
        #   }
        # end

        def album_extra_data
          {
            image: image_data,
            release_date:,
            listeners_count:
          }.compact
        end

        def image
          # album.dig(
          #   'images', 'edges', 0, 'node',
          #   'fullsize', 'sourceUrl'
          # )
          album['thumb']
        end

        def release_date
          # album['released']
          album['year']
        end
      end
    end
  end
end
