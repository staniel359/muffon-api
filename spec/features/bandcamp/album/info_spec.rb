require 'rails_helper'

RSpec.describe Bandcamp::Album::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when link present' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/info/link_success' do
          subject.call(
            link: 'https://wildnothingct.bandcamp.com/album/indigo'
          )
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Album.link_info_data) }
    end

    context 'when artist and album present' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/info/artist_album_success' do
          subject.call(artist: 'wild nothing', album: 'indigo')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Album.query_info_data) }
    end

    context 'when link present but redirected' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/info/link_redirect_success' do
          subject.call(
            link: 'https://luxuryelite.bandcamp.com/album/blind-date'
          )
        end
      end

      it do
        expect(output).to eq(
          Helpers::Bandcamp::Album.link_redirect_info_data
        )
      end
    end

    context 'when artist and album present but redirected' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/info/artist_album_redirect_success' do
          subject.call(artist: 'luxury elite', album: 'blind date')
        end
      end

      it do
        expect(output).to eq(
          Helpers::Bandcamp::Album.query_redirect_info_data
        )
      end
    end
  end

  describe 'no processing' do
    context 'when no args given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong link' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/info/wrong_link' do
          subject.call(link: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end

    context 'when wrong artist' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/info/wrong_artist' do
          subject.call(
            artist: Helpers::Base::RANDOM_STRING,
            album: 'indigo'
          )
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end

    context 'when wrong album' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/info/wrong_album' do
          subject.call(
            artist: 'wild nothing',
            album: Helpers::Base::RANDOM_STRING
          )
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
