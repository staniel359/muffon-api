require 'rails_helper'

RSpec.describe LastFM::Search::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when album exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/search/albums/success' do
          subject.call(album: 'nocturne', limit: 5)
        end
      end

      it { expect(output).to eq(Helpers::LastFM.search_albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no album title given' do
      let(:output) do
        VCR.use_cassette 'lastfm/search/albums/no_title' do
          subject.call(album: nil)
        end
      end

      it { expect(output).to eq(Helpers::LastFM.bad_request_error) }
    end

    context 'when wrong album title' do
      let(:output) do
        VCR.use_cassette 'lastfm/search/albums/wrong_title' do
          subject.call(album: Helpers::LastFM::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::LastFM.not_found_error) }
    end
  end
end
