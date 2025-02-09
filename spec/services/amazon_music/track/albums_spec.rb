RSpec.describe AmazonMusic::Track::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when album_id and track_id present' do
      let(:output) do
        VCR.use_cassette 'services/amazonmusic/track/albums/success' do
          subject.call(album_id: 'B00BRRGQAI', track_id: 'B00BRRGTQ4')
        end
      end

      it { expect(output).to eq(Helpers::AmazonMusic::Track.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no album_id given' do
      let(:output) { subject.call(track_id: 'B00BRRGTQ4') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when no track_id given' do
      let(:output) { subject.call(album_id: 'B00BRRGQAI') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album_id' do
      let(:output) do
        VCR.use_cassette 'services/amazonmusic/track/albums/wrong_album_id' do
          subject.call(album_id: random, track_id: 'B00BRRGTQ4')
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end

    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette 'services/amazonmusic/track/albums/wrong_track_id' do
          subject.call(album_id: 'B00BRRGQAI', track_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
