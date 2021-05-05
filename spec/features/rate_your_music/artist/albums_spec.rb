require 'rails_helper'

RSpec.describe RateYourMusic::Artist::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist present' do
      let(:output) do
        VCR.use_cassette 'rateyourmusic/artist/albums/success' do
          subject.call(
            artist_id: '2854', limit: 5, page: 2, album_type: 'album'
          )
        end
      end

      it { expect(output).to eq(Helpers::RateYourMusic::Artist.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no args' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong artist' do
      let(:output) do
        VCR.use_cassette 'rateyourmusic/artist/albums/wrong_artist' do
          subject.call(
            artist_id: Helpers::Base::RANDOM_STRING, album_type: 'album'
          )
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end

    context 'when no album type' do
      let(:output) do
        VCR.use_cassette 'rateyourmusic/artist/albums/no_album_type' do
          subject.call(artist_id: '2854')
        end
      end

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album type' do
      let(:output) do
        VCR.use_cassette 'rateyourmusic/artist/albums/wrong_album_type' do
          subject.call(
            artist_id: '2854', album_type: Helpers::Base::RANDOM_STRING
          )
        end
      end

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end
  end
end
