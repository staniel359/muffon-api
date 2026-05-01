module MusixMatch
  module Search
    class Tracks
      class Track < MusixMatch::Base
        include MusixMatch::Mixins::Track

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
          Muffon::Formatter::Source::Search::Tracks::Track.call(
            source_original_link:,
            source_name:,
            source_track_id: nil,
            source_track_slug: musixmatch_slug,
            title:,
            artists:,
            album_title:,
            source_album_id: nil,
            source_album_slug: album_musixmatch_slug,
            image_data:,
            duration: nil,
            is_audio_present: audio_present?,
            **self_args
          )
        end

        def raw_track_data
          @args[:raw_track_data]
        end

        def title
          raw_track_data['track_name']
        end

        def artist_name
          raw_track_data['artist_name']
        end

        def raw_musixmatch_slug
          raw_track_data['commontrack_vanity_id']
        end

        def album_title
          raw_track_data['album_name']
        end

        def raw_album_musixmatch_slug
          raw_track_data['album_vanity_id']
        end

        def image_url
          raw_track_data['album_coverart_500x500'].presence
        end
      end
    end
  end
end
