module MusixMatch
  module Search
    class Artists
      class Artist < MusixMatch::Search::Artists
        include MusixMatch::Utils::Artist

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_artist_data
          ]
        end

        def data
          {
            **self_data,
            source: source_data,
            name:,
            image: image_data,
            listeners_count:
          }.compact
        end

        def raw_artist_data
          @args[:raw_artist_data]
        end

        def name
          raw_artist_data['artist_name']
        end

        def musixmatch_slug
          raw_artist_data['artist_vanity_id']
        end

        def raw_image
          return if raw_artist_data['artist_image'].blank?

          raw_artist_data.dig(
            'artist_image',
            'image',
            'image_format_list'
          ).find do |image_data|
            image_data.dig(
              'image_format',
              'image_format_id'
            ) == 3
          end.dig(
            'image_format',
            'image_url'
          )
        end
      end
    end
  end
end
