require 'rails_helper'

RSpec.describe LastFM::Common::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/artist/success' do
          subject.call(
            artist: 'wild nothing', model: 'artist'
          )
        end
      end

      it { expect(output).to eq(Helpers::LastFM.artist_tags_data) }
    end

    context 'when album exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/album/success' do
          subject.call(
            artist: 'wild nothing',
            album: 'nocturne',
            model: 'album'
          )
        end
      end

      it { expect(output).to eq(Helpers::LastFM.album_tags_data) }
    end

    context 'when track exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/track/success' do
          subject.call(
            artist: 'wild nothing',
            track: 'chinatown',
            model: 'track'
          )
        end
      end

      it { expect(output).to eq(Helpers::LastFM.track_tags_data) }
    end
  end

  describe 'no processing' do
    let(:not_found_error) { Helpers::LastFM.not_found_error }

    context 'when no model name given' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/no_model' do
          subject.call(
            artist: 'wild nothing', model: nil
          )
        end
      end

      it { expect(output).to eq(not_found_error) }
    end

    context 'when no artist name given' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/artist/no_artist_name' do
          subject.call(
            artist: nil, model: 'artist'
          )
        end
      end

      it { expect(output).to eq(not_found_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/artist/wrong_artist_name' do
          subject.call(
            artist: Helpers::LastFM::RANDOM_STRING,
            model: 'artist'
          )
        end
      end

      it { expect(output).to eq(not_found_error) }
    end

    context 'when no album title given' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/album/no_album_title' do
          subject.call(
            artist: 'wild nothing', album: nil, model: 'album'
          )
        end
      end

      it { expect(output).to eq(not_found_error) }
    end

    context 'when wrong album title' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/album/wrong_album_title' do
          subject.call(
            artist: 'wild nothing',
            album: Helpers::LastFM::RANDOM_STRING,
            model: 'album'
          )
        end
      end

      it { expect(output).to eq(not_found_error) }
    end

    context 'when no track title given' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/track/no_track_title' do
          subject.call(
            artist: 'wild nothing', track: nil, model: 'track'
          )
        end
      end

      it { expect(output).to eq(not_found_error) }
    end

    context 'when wrong track title' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/track/wrong_track_title' do
          subject.call(
            artist: 'wild nothing',
            track: Helpers::LastFM::RANDOM_STRING,
            model: 'track'
          )
        end
      end

      it { expect(output).to eq(not_found_error) }
    end
  end
end
