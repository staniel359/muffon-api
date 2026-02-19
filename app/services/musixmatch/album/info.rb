module MusixMatch
  module Album
    class Info < MusixMatch::Album::Base
      include MusixMatch::Utils::Album

      private

      def album_data
        if @args[:list]
          album_list_data
        else
          album_full_data
        end
      end

      def album_full_data
        {
          **self_data,
          **album_base_data,
          release_date:,
          listeners_count:,
          tracks:,
          **with_more_data
        }.compact
      end

      def album_list_data
        {
          **self_data,
          **album_base_data,
          release_date:,
          listeners_count:
        }.compact
      end

      def album_base_data
        {
          source: source_data,
          title:,
          artist: artists_minimal_data,
          artists:,
          image: image_data
        }
      end

      def raw_tracks
        raw_album_data['trackList']
      end

      def track_data_formatted(raw_track_data)
        MusixMatch::Album::Info::Track.call(
          raw_track_data:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
