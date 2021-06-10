RSpec.describe VK::Search::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when query string given' do
      let(:output) do
        VCR.use_cassette 'services/vk/search/albums/success' do
          subject.call(query: 'wild nothing')
        end
      end

      it { expect(output).to eq(Helpers::VK::Search.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no query string given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query string' do
      let(:output) do
        VCR.use_cassette 'services/vk/search/albums/wrong_query' do
          subject.call(query: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
