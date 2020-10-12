require 'rails_helper'

RSpec.describe LastFM::Common::Tags do
  subject { described_class }

  let(:random_string) { Helpers::LastFM::RANDOM_STRING }
  let(:not_found_error) { Helpers::LastFM.not_found_error }
  let(:bad_request_error) { Helpers::LastFM.bad_request_error }

  describe 'Artist successful processing' do
    context 'when artist exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/artist/success' do
          subject.call(model: 'artist', artist: 'wild nothing')
        end
      end

      it { expect(output).to eq(Helpers::LastFM.artist_tags_data) }
    end
  end

  describe 'Artist no processing' do
    context 'when no artist name given' do
      let(:output) { subject.call(model: 'artist') }

      it { expect(output).to eq(bad_request_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/artist/wrong_name' do
          subject.call(
            model: 'artist', artist: random_string
          )
        end
      end

      it { expect(output).to eq(not_found_error) }
    end
  end

  describe 'Album successful processing' do
    context 'when album exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/album/success' do
          subject.call(
            model: 'album', artist: 'wild nothing', album: 'nocturne'
          )
        end
      end

      it { expect(output).to eq(Helpers::LastFM.album_tags_data) }
    end
  end

  describe 'Album no processing' do
    context 'when no artist name given' do
      let(:output) do
        subject.call(model: 'album', album: 'nocturne')
      end

      it { expect(output).to eq(bad_request_error) }
    end

    context 'when no album title given' do
      let(:output) do
        subject.call(model: 'album', artist: 'wild nothing')
      end

      it { expect(output).to eq(bad_request_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/album/wrong_name' do
          subject.call(
            model: 'album',
            artist: random_string,
            album: 'nocturne'
          )
        end
      end

      it { expect(output).to eq(not_found_error) }
    end

    context 'when wrong album title' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/album/wrong_title' do
          subject.call(
            model: 'album',
            artist: 'wild nothing',
            album: random_string
          )
        end
      end

      it { expect(output).to eq(not_found_error) }
    end
  end

  describe 'Track successful processing' do
    context 'when track exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/track/success' do
          subject.call(
            model: 'track', artist: 'wild nothing', track: 'chinatown'
          )
        end
      end

      it { expect(output).to eq(Helpers::LastFM.track_tags_data) }
    end
  end

  describe 'Track no processing' do
    context 'when no artist name given' do
      let(:output) do
        subject.call(model: 'track', track: 'chinatown')
      end

      it { expect(output).to eq(bad_request_error) }
    end

    context 'when no track title given' do
      let(:output) do
        subject.call(model: 'track', artist: 'wild nothing')
      end

      it { expect(output).to eq(bad_request_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/track/wrong_name' do
          subject.call(
            model: 'track',
            artist: random_string,
            track: 'chinatown'
          )
        end
      end

      it { expect(output).to eq(not_found_error) }
    end

    context 'when wrong track title' do
      let(:output) do
        VCR.use_cassette 'lastfm/common/tags/track/wrong_title' do
          subject.call(
            model: 'track',
            artist: 'wild nothing',
            track: random_string
          )
        end
      end

      it { expect(output).to eq(not_found_error) }
    end
  end

  describe 'no processing' do
    context 'when no args given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::LastFM.bad_request_error) }
    end

    context 'when no model name given' do
      let(:output) do
        subject.call(
          artist: 'wild nothing', album: 'nocturne', track: 'chinatown'
        )
      end

      it { expect(output).to eq(Helpers::LastFM.bad_request_error) }
    end
  end
end
