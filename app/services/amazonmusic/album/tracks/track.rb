module AmazonMusic
  module Album
    module Tracks
      class Track < AmazonMusic::Album::Base
        include AmazonMusic::Mixins::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_track_data
          ]
        end

        def data
          Muffon::Formatter::Source::Album::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: amazonmusic_id,
            source_track_album_id: album_amazonmusic_id,
            title:,
            artists:,
            image_data:,
            album_data:,
            source_album_id: album_amazonmusic_id,
            duration:,
            is_audio_present: audio_present?,
            **self_args
          )
        end

        def title
          raw_track_data['primaryText']
        end

        def raw_track_data
          @args[:raw_track_data]
        end

        def artist_name
          raw_track_data.dig(
            'contextMenu',
            'options',
            0,
            'onItemSelected',
            1,
            'template',
            'headerPrimaryText'
          )
        end

        def artist_amazonmusic_slug
          raw_track_data.dig(
            'contextMenu',
            'options',
            1,
            'onItemSelected',
            2,
            'template',
            'templateData',
            'deeplink'
          )
        end

        def image_data
          album_data[:image]
        end

        def album_data
          @args[:album_data]
        end

        def album_amazonmusic_id
          album_data.dig(:source, :id)
        end
      end
    end
  end
end
