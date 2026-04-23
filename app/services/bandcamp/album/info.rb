module Bandcamp
  module Album
    class Info < Bandcamp::Album::Base
      TYPES_MODELS_DATA = {
        'a' => 'album',
        't' => 'track'
      }.freeze

      include Bandcamp::Mixins::Album

      private

      def album_data
        if @args[:is_list]
          album_list_data
        else
          album_full_data
        end
      end

      def album_list_data
        Muffon::Formatter::Track::Albums::Album.call(
          source_original_link:,
          source_name:,
          source_album_id: bandcamp_id,
          source_album_artist_id: artist_bandcamp_id,
          source_model: bandcamp_model,
          title:,
          artists:,
          image_data:,
          release_date:
        )
      end

      def album_full_data
        Muffon::Formatter::Album::Info.call(
          source_original_link:,
          source_name:,
          source_album_id: bandcamp_id,
          source_album_artist_id: artist_bandcamp_id,
          source_model: bandcamp_model,
          title:,
          artists:,
          image_data:,
          release_date:,
          description:,
          description_size: 'medium',
          tags:,
          tags_size: 'extrasmall',
          labels: nil,
          plays_count: nil,
          tracks:,
          **self_args
        )
      end

      def bandcamp_id
        raw_album_data['id']
      end

      def artist_bandcamp_id
        raw_album_data.dig(
          'band',
          'band_id'
        )
      end

      def artist_name
        raw_album_data['tralbum_artist']
      end

      def bandcamp_model
        TYPES_MODELS_DATA[album_type]
      end

      def album_type
        raw_album_data['type']
      end

      def track_data_formatted(
        raw_track_data
      )
        Bandcamp::Album::Tracks::Track.call(
          raw_track_data:,
          album_data: album_base_data,
          **self_args
        )
      end

      def album_base_data
        @album_base_data ||=
          Muffon::Formatter::Track::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: bandcamp_id,
            source_album_artist_id: artist_bandcamp_id,
            source_model: bandcamp_model,
            title:,
            artists:,
            image_data:,
            release_date: nil
          )
      end
    end
  end
end
