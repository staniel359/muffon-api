module Discogs
  module Group
    module Tracks
      class Track < Discogs::Group::Base
        include Discogs::Mixins::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_track_data
            artists
            album_data
          ]
        end

        def data
          Muffon::Formatter::Source::AlbumGroup::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: discogs_id,
            title:,
            artists:,
            image_data:,
            album_data:,
            duration:,
            is_audio_present: audio_present?,
            **self_args
          )
        end

        def raw_track_data
          @args[:raw_track_data]
        end

        def artists
          if raw_artists.present?
            super
          else
            @args[:artists]
          end
        end

        def image_data
          album_data[:image]
        end

        def album_data
          @args[:album_data]
        end
      end
    end
  end
end
