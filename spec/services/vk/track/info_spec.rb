RSpec.describe VK::Track::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id given' do
      let(:output) do
        VCR.use_cassette(
          'services/vk/track/info/success'
        ) do
          subject.call(
            track_id: '474499137_456584653',
            with_audio: true,
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(vk_track_info_data) }
    end

    context 'when track with no album' do
      let(:output) do
        VCR.use_cassette(
          'services/vk/track/info/success_no_album'
        ) do
          subject.call(
            track_id: '-400921_90392497',
            with_audio: true,
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(vk_track_info_no_album_data) }
    end
  end

  describe 'no processing' do
    context 'when no track_id given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette(
          'services/vk/track/info/wrong_id'
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
