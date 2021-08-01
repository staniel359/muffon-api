module Muffon
  module Utils
    module Artist
      private

      def library_id
        return if @args.profile_id.blank?

        find_profile_artist&.id
      end

      def find_profile_artist
        ProfileArtist.find_by(
          profile_id: @args.profile_id,
          artist_id: find_artist.id
        )
      end

      def find_artist
        @find_artist ||= ::Artist.with_name(
          name
        )
      end
    end
  end
end
