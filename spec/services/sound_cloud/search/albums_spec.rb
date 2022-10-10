RSpec.describe SoundCloud::Search::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'services/soundcloud/search/albums/success' do
          subject.call(query: 'wild nothing', limit: 10, page: 2, profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::SoundCloud::Search.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'services/soundcloud/search/albums/wrong_query' do
          subject.call(query: random)
        end
      end

      it { expect(output).to eq(Helpers::Search.no_albums_data) }
    end
  end
end
