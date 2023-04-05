RSpec.describe YouTube::Search::Channels do
  subject { described_class }

  describe 'successful processing' do
    context 'when query present' do
      let(:output) do
        VCR.use_cassette 'services/youtube/search/channels/success' do
          subject.call(query: 'kexp', limit: 5, page: 'CAUQAA')
        end
      end

      it { expect(output).to eq(Helpers::YouTube::Search.channels_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'services/youtube/search/channels/wrong_query' do
          subject.call(query: random)
        end
      end

      it { expect(output).to eq(Helpers::Search.youtube_no_channels_data) }
    end
  end
end
