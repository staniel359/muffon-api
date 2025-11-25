RSpec.describe YouTubeMusic::Search::Mixes do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette(
          'services/youtubemusic/search/mixes/success'
        ) do
          subject.call(
            query: '80s',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(youtube_music_search_mixes_data) }
    end

    context 'when query present with next page' do
      let(:output) do
        VCR.use_cassette(
          'services/youtubemusic/search/mixes/success_next_page'
        ) do
          subject.call(
            query: '80s',
            page: youtube_music_search_mixes_next_page
          )
        end
      end

      it { expect(output).to eq(youtube_music_search_mixes_next_page_data) }
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
          'services/youtubemusic/search/mixes/wrong_query'
        ) do
          subject.call(
            query: random_string
          )
        end
      end

      it { expect(output).to eq(search_missing_mixes_data) }
    end
  end
end
