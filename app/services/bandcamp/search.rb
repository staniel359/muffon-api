module Bandcamp
  class Search < Bandcamp::Base
    private

    def primary_args
      [@args.query]
    end

    def no_data?
      search_response.blank?
    end

    def search_response
      @search_response ||=
        Bing::Search.call(search_args)[:search]
    end

    def search_args
      {
        query: query,
        page: @args.page,
        limit: @args.limit
      }
    end

    def query
      "#{@args.query} site:bandcamp.com"
    end

    def data
      { search: search_data }
    end

    def search_data
      {
        page: search_response[:page],
        results: search_response[:results]
      }
    end
  end
end
