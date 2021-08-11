module Muffon
  module Utils
    module Album
      private

      def library_id
        return if @args.profile_id.blank?

        find_profile_album&.id
      end

      def find_profile_album
        ProfileAlbum.find_by(
          profile_id: @args.profile_id,
          album_id: find_album.id
        )
      end

      def find_album
        @find_album ||= ::Album.with_artist_title(
          find_artist.id, title
        )
      end

      def find_artist
        ::Artist.with_name(
          artist_name
        )
      end

      def artist_name
        artist_names
      end

      def listeners_count
        find_album.listeners_count
      end
    end
  end
end