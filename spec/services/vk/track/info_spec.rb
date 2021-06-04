require 'rails_helper'

RSpec.describe VK::Track::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id given' do
      let(:track_id) do
        '371745443_456465176_6e46a45bb6be1e67e6_698622eb5a2c8a0616'
      end
      let(:output) do
        VCR.use_cassette 'services/vk/track/info/success' do
          subject.call(track_id: track_id)
        end
      end

      it { expect(output).to eq(Helpers::VK::Track.info_data) }
    end

    context 'when track with no album' do
      let(:track_id) do
        '-400921_90392497_a11e43c96aba9c3335_11b443938410e06e4b'
      end
      let(:output) do
        VCR.use_cassette 'services/vk/track/info/success_no_album' do
          subject.call(track_id: track_id)
        end
      end

      it { expect(output).to eq(Helpers::VK::Track.info_no_album_data) }
    end
  end

  describe 'no processing' do
    context 'when no track_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette 'services/vk/track/info/wrong_id' do
          subject.call(track_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
