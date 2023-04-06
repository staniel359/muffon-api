RSpec.describe YouTube::Search::Playlists do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'services/youtube/search/playlists/success' do
          subject.call(query: '80s', limit: 5, page: 'CAUQAA')
        end
      end

      it { expect(output).to eq(Helpers::YouTube::Search.playlists_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'services/youtube/search/playlists/wrong_query' do
          subject.call(query: random)
        end
      end

      it { expect(output).to eq(Helpers::Search.youtube_no_playlists_data) }
    end
  end
end
