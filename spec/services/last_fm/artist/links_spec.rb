RSpec.describe LastFM::Artist::Links do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist exists' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/artist/links/success'
        ) do
          subject.call(
            artist_name: 'wild nothing'
          )
        end
      end

      it { expect(output).to eq(lastfm_artist_links_data) }
    end
  end

  describe 'no processing' do
    context 'when no name given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong name' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/artist/links/wrong_name'
        ) do
          subject.call(
            artist_name: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
