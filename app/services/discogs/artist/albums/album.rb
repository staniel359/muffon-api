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
          muffon_data
            .merge(album_data)
        end

        def album_data
          {
            source_id: SOURCE_ID,
            discogs_id:,
            discogs_type:,
            title:,
            image: image_data,
            release_date:,
            listeners_count:
          }.compact
        end

        def title
          album.css(
            'td.title > a'
          )[0].text
        end

        def album
          @args[:album]
        end

        def discogs_id
          album['data-object-id'].to_i
        end

        def discogs_type
          group? ? 'group' : 'album'
        end

        def group?
          album[
            'data-object-type'
          ].include?('master')
        end

        def artists_list
          artist_node.css('a')
        end

        def artist_data_formatted(artist)
          {
            name: artist.text,
            discogs_id: artist_discogs_id(artist)
          }
        end

        def artist_node
          @artist_node ||= album.css(
            'td.artist'
          )
        end

        def artist_discogs_id(artist)
          artist['href'].match(
            %r{/(\d+)-}
          )[1].to_i
        end

        def image
          return if raw_image.blank?

          raw_image['data-src']
        end

        def raw_image
          @raw_image ||= album.css(
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
          @release_date_node ||= album.css(
            'td.year'
          )
        end
      end
    end
  end
end
