RSpec.describe RateYourMusic::Album::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when album given' do
      let(:output) do
        VCR.use_cassette 'services/rateyourmusic/album/info/success' do
          subject.call(album: 'release/album/sparks/in-outer-space/', profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::RateYourMusic::Album.info_data) }
    end

    context 'when different artists' do
      let(:output) do
        VCR.use_cassette 'services/rateyourmusic/album/info/different_artists' do
          subject.call(album: 'release/comp/various-artists/i-love-disco-diamonds-vol_6/', profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::RateYourMusic::Album.info_different_artists_data) }
    end

    context 'when multiple artists' do
      let(:output) do
        VCR.use_cassette 'services/rateyourmusic/album/info/multiple_artists' do
          subject.call(album: 'release/album/lsd/labrinth-sia-and-diplo-present-lsd/', profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::RateYourMusic::Album.info_multiple_artists_data) }
    end
  end

  describe 'no processing' do
    context 'when no album given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album' do
      let(:output) do
        VCR.use_cassette 'services/rateyourmusic/album/info/wrong_id' do
          subject.call(album: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
