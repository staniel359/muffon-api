module MusicBrainz
  module Track
    class Info < MusicBrainz::Track::Base
      include Muffon::Utils::Track
      include MusicBrainz::Mixins::Track

      private

      def track_data
        Muffon::Formatter::Track::Info.call(
          source_original_link:,
          source_name:,
          source_track_id: musicbrainz_id,
          title:,
          artists:,
          album_title:,
          source_album_id: album_musicbrainz_id,
          album_model: 'album',
          image_data:,
          release_date:,
          duration:,
          description: nil,
          description_size: nil,
          plays_count: nil,
          tags:,
          tags_size: 'extrasmall',
          is_audio_present: audio_present?,
          audio_link:,
          **self_args
        )
      end
    end
  end
end
