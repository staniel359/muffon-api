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
          {
            title: title,
            discogs_id: discogs_id,
            discogs_type: discogs_type,
            image: image_data,
            release_date: release_date
          }
        end

        def title
          @args.album.css(
            'td.title > a'
          )[0].text
        end

        def discogs_id
          @args.album['data-object-id'].to_i
        end

        def discogs_type
          group? ? 'group' : 'album'
        end

        def group?
          @args.album[
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
          @artist_node ||= @args.album.css(
            'td.artist'
          )
        end

        def artist_discogs_id(artist)
          artist['href'].match(
            %r{/(\d+)-}
          )[1].to_i
        end

        def image
          @args.album.css(
            'td.image img'
          )[0]['data-src']
        end

        def release_date
          date? ? release_date_node.text : ''
        end

        def date?
          release_date_node.text != 'Unknown'
        end

        def release_date_node
          @release_date_node ||= @args.album.css(
            'td.year'
          )
        end
      end
    end
  end
end