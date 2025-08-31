RSpec.describe Google::Search do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette(
        'services/google/search/success'
      ) do
        subject.call(
          query: 'pop',
          scope: 'lastfm_tags',
          page: 2
        )
      end
    end

    it { expect(output).to eq(Helpers::Google.search_data) }
  end

  describe 'no processing' do
    context 'when no query given' do
      let(:output) { subject.call(scope: 'lastfm_tags') }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when no scope given' do
      let(:output) { subject.call(query: 'pop') }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong scope' do
      let(:output) do
        VCR.use_cassette(
          'services/google/search/wrong_scope'
        ) do
          subject.call(
            query: 'pop',
            scope: random_string
          )
        end
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end
  end
end
