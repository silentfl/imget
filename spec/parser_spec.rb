require 'spec_helper'

describe Imget::Page do
  let(:src) { 'http://example.com/1.jpg' }
  let(:html) { "<html><body><img src='#{src}'></img></body></html>" }

  it { expect(Imget::Page.new(html).images).to eq([src]) }
end
