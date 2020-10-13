require 'rails_helper'

RSpec.describe Bandcamp::Album::Link do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist and album present' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/link/success' do
          subject.call(artist: 'wild nothing', album: 'indigo')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp.album_link_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist' do
      let(:output) { subject.call(album: 'indigo') }

      it { expect(output).to eq(Helpers::Bandcamp.bad_request_error) }
    end

    context 'when no album' do
      let(:output) { subject.call(artist: 'wild nothing') }

      it { expect(output).to eq(Helpers::Bandcamp.bad_request_error) }
    end

    context 'when wrong artist' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/link/wrong_artist' do
          subject.call(
            artist: Helpers::Bandcamp::RANDOM_STRING,
            album: 'indigo'
          )
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp.not_found_error) }
    end

    context 'when wrong album' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/link/wrong_album' do
          subject.call(
            artist: 'wild nothing',
            album: Helpers::Bandcamp::RANDOM_STRING
          )
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp.not_found_error) }
    end
  end
end
