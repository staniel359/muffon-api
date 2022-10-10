RSpec.describe Google::Search do
  subject { described_class }

  describe 'successful processing' do
    context 'when query and scope present' do
      let(:output) do
        VCR.use_cassette 'services/google/search/success' do
          subject.call(
            query: 'wild nothing', scope: 'bandcamp_albums', page: 2
          )
        end
      end

      it { expect(output).to eq(Helpers::Google.search_data) }
    end
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call(scope: 'bandcamp_albums') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when no scope given' do
      let(:output) { subject.call(query: 'wild nothing') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong query' do
      let(:output) do
        VCR.use_cassette 'services/google/search/wrong_query' do
          subject.call(query: random, scope: 'bandcamp_albums')
        end
      end

      it { expect(output).to eq(Helpers::Search.no_results_data) }
    end

    context 'when wrong scope' do
      let(:output) do
        VCR.use_cassette 'services/google/search/wrong_scope' do
          subject.call(query: 'wild nothing', scope: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end
  end
end
