module Muffon
  module Utils
    module Album
      private

      def album_record
        @album_record ||=
          ::Album.with_artist_title(
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

      def self_data
        Muffon::Self.call(
          **self_args,
          model: 'album',
          model_id: album_record.id
        )
      end
    end
  end
end
