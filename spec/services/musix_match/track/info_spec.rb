RSpec.describe MusixMatch::Track::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_slug present' do
      let(:output) do
        VCR.use_cassette(
          'services/musixmatch/track/info/success'
        ) do
          subject.call(
            track_slug: 'Wild-Nothing/Chinatown',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(musixmatch_track_info_data) }
    end
  end

  describe 'no processing' do
    context 'when no track_slug given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong track_slug' do
      let(:output) do
        VCR.use_cassette(
          'services/musixmatch/track/info/wrong_slug'
        ) do
          subject.call(
            track_slug: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
