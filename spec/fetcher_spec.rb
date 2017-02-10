require 'spec_helper'

describe Imget::Fetcher do
  describe :failed do
    let(:url_raise) { 'http://raised.com' }
    let(:url_500) { 'http://crashed.com' }

    before do
      stub_request(:get, url_raise).and_raise(::HTTParty::Error)
      stub_request(:get, url_500).and_return(status: 500, body: nil, headers: {})
    end

    it { expect { Imget::Fetcher.get(url_raise) }.to raise_error(Imget::NetworkError) }
    it { expect { Imget::Fetcher.get(url_500) }.to raise_error(Imget::NetworkError) }
  end

  describe :success do
    let(:url) { 'http://example.com' }
    let(:code) { 200 }
    let(:body) { 'ok' }

    before do
      stub_request(:get, url).to_return(status: 200, body: 'ok', headers: {})
    end

    it { expect(Imget::Fetcher.get(url)).to eq(body) }
  end
end
