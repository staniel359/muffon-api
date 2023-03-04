module Helpers
  module Search
    class << self
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

      def youtube_no_tracks_data
        {:search=>{:tracks=>[]}}
      end

      def no_results_data
        {:search=>{:page=>1, :results=>[]}}
      end
    end
  end
end
