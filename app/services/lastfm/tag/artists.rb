module LastFM
  module Tag
    class Artists < LastFM::Tag::Web::Base
      COLLECTION_NAME = 'artists'.freeze
      include LastFM::Tag::Utils::Pagination

      private

      def artists_list
        return [sample_artist].compact if @args[:sample]

        raw_artists_list
      end

      def sample_artist
        raw_artists_list.to_a.sample
      end

      def raw_artists_list
        @raw_artists_list ||=
          response_data.css(
            '.big-artist-list-item'
          )
      end

      def collection_item_data_formatted(artist)
        LastFM::Tag::Artists::Artist.call(
          artist: artist,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
