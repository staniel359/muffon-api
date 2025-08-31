RSpec.describe LastFM::Search::Artists do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/search/artists/success'
        ) do
          subject.call(
            query: 'a',
            limit: 5,
            page: 2,
            profile_id: 1
          )
        end
      end

      it { expect(output).to eq(lastfm_search_artists_data) }
    end
  end

  describe 'no processing' do
    context 'when no query' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/search/artists/wrong_query'
        ) do
          subject.call(
            query: random_string
          )
        end
      end

      it { expect(output).to eq(no_artists_data) }
    end
  end
end
