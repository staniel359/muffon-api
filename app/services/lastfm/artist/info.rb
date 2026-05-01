module LastFM
  module Artist
    class Info < LastFM::Artist::Base
      API_METHOD = 'artist.getInfo'.freeze

      include LastFM::Mixins::Artist

      private

      def request_params
        {
          **super,
          lang: language
        }.compact
      end

      def artist_data
        update_record_data!

        Muffon::Formatter::Source::Artist::Info.call(
          source_original_link:,
          source_name:,
          source_artist_id: nil,
          name:,
          image_data:,
          plays_count:,
          description:,
          tags:,
          tags_size: 'extrasmall',
          recommendation_data:,
          **self_args
        )
      end

      def recommendation_data
        LastFM::Artist::Info::Recommendation.call(
          artist_name: name,
          **self_args
        )
      end
    end
  end
end
