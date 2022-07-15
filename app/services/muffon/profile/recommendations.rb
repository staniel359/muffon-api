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
        @total_items_count ||=
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
        Muffon::Profile::Recommendations::Filter::Artists.call(
          profile_id: @args[:profile_id],
          filter_value: @args[:filter_value]
        )
      end

      def recommendations_tags_filtered
        Muffon::Profile::Recommendations::Filter::Tags.call(
          profile_id: @args[:profile_id],
          filter_value: @args[:filter_value]
        )
      end

      def recommendations
        if @args[:hide_library_artists]
          recommendations_library_artists_hidden
        else
          recommendations_not_deleted
        end
      end

      def recommendations_library_artists_hidden
        Muffon::Profile::Recommendations::Hide::LibraryArtists.call(
          profile_id: @args[:profile_id],
          tracks_count: @args[:tracks_count]
        )
      end

      def recommendations_not_deleted
        profile
          .recommendations
          .not_deleted
      end

      def collection_list
        recommendations_filtered
          .library_artists_count_desc_ordered
          .limit(limit)
          .offset(offset)
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
