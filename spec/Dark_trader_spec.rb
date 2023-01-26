require_relative '../lib/Dark_trader.rb/'

describe "#crypto_name" do
  it "should return values" do
    expect(crypto_name(("//tr[1]//td[3]//div"))).to eq("BTC")
  end
end