module Muffon
  module Utils
    module Track
      private

      def player_source_id
        [
          player_id,
          source_id
        ].compact.join(
          '-'
        )
      end

      def player_id
        return '1' if test?

        find_track.player_id
      end

      def source_id
        source_data.try(:[], :id) ||
          source_data.try(:[], 'id')
      end

      def find_track
        @find_track ||=
          ::Track.with_artist_title(
            artist_id: find_artist.id,
            title:
          )
      end

      def find_artist
        @find_artist ||=
          ::Artist.with_name(
            artist_name
          )
      end

      def find_album
        return if album_title.blank?

        @find_album ||=
          ::Album.with_artist_title(
            artist_id: find_artist.id,
            title: album_title
          )
      end

      def self_data
        Muffon::Self.call(
          profile_id:,
          token: @args[:token],
          model: 'track',
          model_id: track_id
        )
      end

      def profile_id
        @args[:profile_id]
      end

      def track_id
        find_track.id
      end

      def profiles_count
        return if test?

        find_track
          .profiles
          .not_deleted
          .count
      end

      def audio_minimal_data
        { present: audio_present? }
      end

      def audio_base_data
        {
          present: audio_present?,
          link: audio_link_conditional
        }.compact
      end

      def audio_link_conditional
        audio_link if @args[:with_audio]
      end

      def with_query_match(
        title:,
        query_title:,
        artist_name:,
        query_artist_name:
      )
        if @args[:is_with_query_match].present?
          if matches_query?(
            title:,
            query_title:,
            artist_name:,
            query_artist_name:
          )
            yield
          end
        else
          yield
        end
      end

      def matches_query?(
        title:,
        query_title:,
        artist_name:,
        query_artist_name:
      )
        is_titles_match =
          title.downcase.include?(
            query_title.downcase
          )

        is_artists_names_match =
          artist_name.downcase.include?(
            query_artist_name.downcase
          )

        is_titles_match &&
          is_artists_names_match
      end
    end
  end
end
