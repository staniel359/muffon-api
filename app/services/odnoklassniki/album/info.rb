module Odnoklassniki
  module Album
    class Info < Odnoklassniki::Album::Base
      private

      def album_data
        muffon_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        {
          source_id: SOURCE_ID,
          title:,
          artists:
        }
      end

      def album_extra_data
        {
          image: image_data,
          release_date:,
          tags: tags&.first(5),
          tracks:
        }.compact
      end

      def tags_list
        album['genres']
      end

      def tracks_list
        response_data['tracks']
      end

      def track_data_formatted(track)
        Odnoklassniki::Album::Info::Track.call(
          track:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
