require 'rails_helper'

RSpec.describe Bandcamp::Track::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when track present with album' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/track/info/success_album' do
          subject.call(artist_id: '2228040235', track_id: '2723372494')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Track.info_album_data) }
    end

    context 'when track present with description' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/track/info/success_description' do
          subject.call(artist_id: '2228040235', track_id: '1709958085')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Track.info_description_data) }
    end
  end

  describe 'no processing' do
    context 'when no args' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/track/info/wrong_track' do
          subject.call(artist_id: '2228040235', track_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
