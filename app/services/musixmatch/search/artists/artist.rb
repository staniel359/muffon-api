module MusixMatch
  module Search
    class Artists
      class Artist < MusixMatch::Search::Artists
        include MusixMatch::Mixins::Artist

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
          Muffon::Formatter::Source::Search::Artists::Artist.call(
            source_original_link:,
            source_name:,
            source_artist_id: nil,
            source_artist_slug: musixmatch_slug,
            name:,
            image_data:,
            **self_args
          )
        end

        def raw_artist_data
          @args[:raw_artist_data]
        end

        def name
          raw_artist_data['artist_name']
        end

        def image_url
          return if raw_artist_data['artist_image'].blank?

          raw_artist_data
            .dig(
              'artist_image',
              'image',
              'image_format_list'
            )
            .find do |image_data|
              image_data.dig(
                'image_format',
                'image_format_id'
              ) == 3
            end
            .dig(
              'image_format',
              'image_url'
            )
            .presence
        end
      end
    end
  end
end
