require 'rails_helper'

RSpec.describe Bandcamp::Album::Links do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist and album present' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/links/success' do
          subject.call(artist: 'luxury elite', album: 'tv party')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp.album_links_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist' do
      let(:output) { subject.call(album: 'tv party') }

      it { expect(output).to eq(Helpers::Bandcamp.bad_request_error) }
    end

    context 'when no album' do
      let(:output) { subject.call(artist: 'luxury elite') }

      it { expect(output).to eq(Helpers::Bandcamp.bad_request_error) }
    end

    context 'when wrong artist' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/links/wrong_artist' do
          subject.call(
            artist: Helpers::Bandcamp::RANDOM_STRING,
            album: 'tv party'
          )
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp.not_found_error) }
    end

    context 'when wrong album' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/links/wrong_album' do
          subject.call(
            artist: 'luxury elite',
            album: Helpers::Bandcamp::RANDOM_STRING
          )
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp.not_found_error) }
    end
  end
end
