RSpec.describe MusicBrainz::Album::Links do
  subject { described_class }

  describe 'successful processing' do
    context 'when album_id given' do
      let(:output) do
        VCR.use_cassette 'services/musicbrainz/album/links/success' do
          subject.call(album_id: 'bee184b6-493b-46bc-a3a1-31e434367c4a')
        end
      end

      it { expect(output).to eq(Helpers::MusicBrainz::Album.links_data) }
    end
  end

  describe 'no processing' do
    context 'when no album_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album_id' do
      let(:output) do
        VCR.use_cassette 'services/musicbrainz/album/links/wrong_id' do
          subject.call(album_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end