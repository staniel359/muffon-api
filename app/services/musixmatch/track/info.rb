module MusixMatch
  module Track
    class Info < MusixMatch::Track::Base
      include MusixMatch::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Source::Track::Info.call(
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
          release_date: nil,
          duration: nil,
          description: nil,
          description_size: nil,
          tags: nil,
          tags_size: nil,
          lyrics:,
          lyrics_size: 'small',
          plays_count: nil,
          is_audio_present: audio_present?,
          audio_link:,
          **self_args
        )
      end

      def lyrics
        response_data.dig(
          'pageProps',
          'data',
          'trackInfo',
          'data',
          'lyrics',
          'body'
        )
      end
    end
  end
end
