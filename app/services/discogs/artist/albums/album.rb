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
          album.css(
            'td.title > a'
          )[0].text
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
          album['data-object-id'].to_i
        end

        def discogs_model
          group? ? 'group' : 'album'
        end

        def group?
          album[
            'data-object-type'
          ].include?('master')
        end

        def artists_list
          album.css(
            'td.artist a'
          )
        end

        def artist_data_formatted(artist)
          {
            source:
              artist_source_data(artist),
            name: artist.text
          }
        end

        def artist_source_data(artist)
          {
            name: source_name,
            id: artist_discogs_id(artist)
          }.compact
        end

        def artist_discogs_id(artist)
          artist['href'].match(
            %r{/(\d+)-}
          ).try(:[], 1)&.to_i
        end

        def album_extra_data
          {
            image: image_data,
            release_date:,
            listeners_count:
          }.compact
        end

        def image
          raw_image.try(
            :[], 'data-src'
          )
        end

        def raw_image
          album.css(
            'td.image img'
          )[0]
        end

        def release_date
          date? ? release_date_node.text : ''
        end

        def date?
          release_date_node.text != 'Unknown'
        end

        def release_date_node
          album.css(
            'td.year'
          )
        end
      end
    end
  end
end
