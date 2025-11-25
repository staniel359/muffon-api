module Spec
  module Helpers
    module Search
      def search_paginated_missing_artists_data
        {:search=>{:page=>1, :artists=>[]}}
      end

      def search_paginated_missing_albums_data
        {:search=>{:page=>1, :albums=>[]}}
      end

      def search_paginated_missing_tracks_data
        {:search=>{:page=>1, :tracks=>[]}}
      end

      def search_paginated_missing_groups_data
        {:search=>{:page=>1, :groups=>[]}}
      end

      def search_paginated_missing_tags_data
        {:search=>{:page=>1, :tags=>[]}}
      end

      def search_paginated_missing_labels_data
        {:search=>{:page=>1, :labels=>[]}}
      end

      def search_paginated_missing_results_data
        {:search=>{:page=>1, :results=>[]}}
      end

      def search_missing_artists_data
        {:search=>{:artists=>[]}}
      end

      def search_missing_albums_data
        {:search=>{:albums=>[]}}
      end

      def search_missing_tracks_data
        {:search=>{:tracks=>[]}}
      end

      def search_missing_videos_data
        {:search=>{:videos=>[]}}
      end

      def search_missing_channels_data
        {:search=>{:channels=>[]}}
      end

      def search_missing_mixes_data
        {:search=>{:mixes=>[]}}
      end

      def search_missing_playlists_data
        {:search=>{:playlists=>[]}}
      end
    end
  end
end
