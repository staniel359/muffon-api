module Muffon
  module Profile
    class Recommendations < Muffon::Profile::Base
      COLLECTION_NAME = 'recommendations'.freeze
      include Muffon::Utils::Pagination

      private

      def data
        return forbidden if wrong_profile?

        super
      end

      def profile_data
        profile_base_data
          .merge(paginated_data)
      end

      def profile_base_data
        { nickname: }
      end

      def total_items_count
        recommendations_filtered.size
      end

      def recommendations_filtered
        @recommendations_filtered ||=
          case @args[:filter]
          when 'artists'
            recommendations_artists_filtered
          when 'tags'
            recommendations_tags_filtered
          else
            recommendations
          end
      end

      def recommendations_artists_filtered
        recommendations.where(
          'library_artist_ids @> ARRAY[?]',
          library_artist_ids
        )
      end

      def recommendations
        profile
          .recommendations
          .not_deleted
      end

      def library_artist_ids
        profile
          .library_artists
          .where(artist_id: artist_ids)
          .pluck(:id)
      end

      def artist_ids
        @args[:filter_value].map do |name|
          artist_id(name)
        end.compact
      end

      def artist_id(name)
        Artist.with_name(name)&.id
      end

      def recommendations_tags_filtered
        recommendations
          .left_joins(:artist)
          .where(
            'artists.tag_ids @> ARRAY[?]',
            tag_ids
          )
      end

      def tag_ids
        @args[:filter_value].map do |name|
          tag_id(name)
        end.compact
      end

      def tag_id(name)
        Tag.with_name(name)&.id
      end

      def collection_list
        recommendations_filtered
          .library_artists_count_desc_ordered
          .limit(limit)
          .offset(offset)
          .associated
      end

      def collection_item_data_formatted(recommendation)
        Muffon::Profile::Recommendations::Recommendation.call(
          recommendation:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
