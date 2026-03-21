RSpec.describe YouTubeMusic::Search::Artists do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette(
          'services/youtubemusic/search/artists/success'
        ) do
          subject.call(
            query: 'pet shop boys',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to match_hash(youtube_music_search_artists_data) }
    end

    context 'when query present with next page' do
      let(:output) do
        VCR.use_cassette(
          'services/youtubemusic/search/artists/success_next_page'
        ) do
          subject.call(
            query: 'kate',
            page: youtube_music_search_artists_next_page
          )
        end
      end

      it { expect(output).to match_hash(youtube_music_search_artists_next_page_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette(
          'services/youtubemusic/search/artists/wrong_query'
        ) do
          subject.call(
            query: random_string
          )
        end
      end

      it { expect(output).to match_hash(search_missing_artists_data) }
    end
  end
end
