module Spec
  module Helpers
    module Search
      def no_artists_data
        {:search=>{:artists=>[], :page=>1}}
      end

      def no_albums_data
        {:search=>{:albums=>[], :page=>1}}
      end

      def no_groups_data
        {:search=>{:groups=>[], :page=>1}}
      end

      def no_tracks_data
        {:search=>{:page=>1, :tracks=>[]}}
      end

      def no_tags_data
        {:search=>{:page=>1, :tags=>[]}}
      end

      def no_labels_data
        {:search=>{:labels=>[], :page=>1}}
      end

      def youtube_no_videos_data
        {:search=>{:videos=>[]}}
      end

      def youtube_no_channels_data
        {:search=>{:channels=>[]}}
      end

      def youtube_no_mixes_data
        {:search=>{:mixes=>[]}}
      end

      def youtube_no_playlists_data
        {:search=>{:playlists=>[]}}
      end

      def youtube_no_tracks_data
        {:search=>{:tracks=>[]}}
      end

      def no_results_data
        {:search=>{:page=>1, :results=>[]}}
      end

      def amazonmusic_no_artists_data
        {:search=>{:artists=>[]}}
      end

      def amazonmusic_no_albums_data
        {:search=>{:albums=>[]}}
      end

      def amazonmusic_no_tracks_data
        {:search=>{:tracks=>[]}}
      end
    end
  end
end
