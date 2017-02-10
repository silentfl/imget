require 'spec_helper'

describe Imget do
  let(:url) { 'http://example.com' }

  let(:links) do
    [
      "#{url}/image1.gif",
      "#{url}/image2.jpg",
      "#{url}/image3.png"
    ]
  end

  before do
    allow(Imget::Fetcher).to receive(:get).and_return(<<-HTML
      <html>
        <body>
          #{links.map { |url| "<img src='#{url}'>image</img>" }}
        </body>
      </html>
      HTML
    )
  end

  it :images_from do
    expect(Imget.images_from(url)).to eq(links)
  end
end
