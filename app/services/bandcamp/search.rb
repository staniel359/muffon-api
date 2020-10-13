module Bandcamp
  class Search < Muffon::Base
    def call
      return bad_request_error if not_all_args?
      return not_found_error if no_data?

      data
    end

    private

    def primary_args
      [@args.query]
    end

    def no_data?
      search_response.blank?
    end

    def search_response
      @search_response ||= Bing::Search.call(
        query: query, page: @args.page
      )[:search]
    end

    def query
      "#{@args.query} site:bandcamp.com"
    end

    def data
      { search: search_data }
    end

    def search_data
      {
        results: search_response[:results],
        page: search_response[:page]
      }
    end

    # def album_regexp
    #   %r{https?://(\w+(?:-\w+)*.bandcamp.com
    #     /(?:album|track)/\w+(?:-\w+)*)}x
    # end
  end
end
