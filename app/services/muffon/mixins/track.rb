module Muffon
  module Mixins
    module Track
      private

      def player_source_id
        [
          player_id,
          source_id
        ]
          .compact
          .join('-')
      end

      def player_id
        return '1' if test?

        track_record.player_id
      end

      def source_id
        source_data.try(:[], :id) ||
          source_data.try(:[], 'id')
      end

      def track_record
        @track_record ||=
          ::Track.with_artist_title(
            artist_id: artist_record.id,
            title:
          )
      end

      def artist_record
        @artist_record ||=
          ::Artist.with_name(
            artist_name
          )
      end

      def album_record
        return if album_title.blank?

        @album_record ||=
          ::Album.with_artist_title(
            artist_id: artist_record.id,
            title: album_title
          )
      end

      def self_data
        Muffon::Utils::Self.call(
          **self_args,
          model: 'track',
          model_id: track_record.id
        )
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
          title
          .downcase
          .include?(
            query_title.downcase
          )

        is_artists_names_match =
          artist_name
          .downcase
          .include?(
            query_artist_name.downcase
          )

        is_titles_match &&
          is_artists_names_match
      end
    end
  end
end
