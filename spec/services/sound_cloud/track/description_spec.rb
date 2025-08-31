RSpec.describe SoundCloud::Track::Description do
  subject { described_class }

  describe 'successful processing' do
    context 'when track present' do
      let(:output) do
        VCR.use_cassette(
          'services/soundcloud/track/description/success'
        ) do
          subject.call(
            track_id: '276297603'
          )
        end
      end

      it { expect(output).to eq(soundcloud_track_description_data) }
    end
  end

  describe 'no processing' do
    context 'when no args' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong track' do
      let(:output) do
        VCR.use_cassette(
          'services/soundcloud/track/description/wrong_track'
        ) do
          subject.call(
            track_id: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
