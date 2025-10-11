RSpec.describe Muffon::Radio::Artist::Tracks do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist exists' do
      let(:output) do
        VCR.use_cassette(
          'services/muffon/radio/artist/tracks/success'
        ) do
          subject.call(
            artist_name: 'wild nothing'
          )
        end
      end

      it { expect(output).to eq(muffon_radio_artist_tracks_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist name given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette(
          'services/muffon/radio/artist/tracks/wrong_name'
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
