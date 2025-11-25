RSpec.describe VK::Search::Tracks do
  subject { described_class }

  describe 'successful processing' do
    context 'when query string given' do
      let(:output) do
        VCR.use_cassette(
          'services/vk/search/tracks/success'
        ) do
          subject.call(
            query: 'wild nothing',
            page: '2',
            limit: '5',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(vk_search_tracks_data) }
    end
  end

  describe 'no processing' do
    context 'when no query string given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end
  end
end
