module API
  class GitHubController < API::BaseController
    def releases; end

    private

    def releases_data
      ::GitHub::Releases.call(
        params.slice(
          *%i[
            page
            limit
          ]
        )
      )
    end
  end
end
