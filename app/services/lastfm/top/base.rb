module LastFM
  module Top
    class Base < LastFM::Kerve::Base
      TOTAL_LIMIT = 10_000

      private

      def f_param
        return if @args[:country].blank?

        "geo:#{@args[:country]}"
      end

      def data
        { top: paginated_data }
      end

      alias link charts_link
    end
  end
end
