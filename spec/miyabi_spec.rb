require 'spec_helper'

RSpec.describe Miyabi do
  it 'has a version number' do
    expect(Miyabi::VERSION).not_to be nil
  end
end

RSpec.describe String do
  it 'to_kanhira' do
    ENV["ONLINE"] or skip "offline"
    require "miyabi/format_string_online"
    String.include(Miyabi::FormatStringOnline)
    expect('漢字'.to_kanhira).to eq 'かんじ'
  end

  it 'to_roman' do
    expect('さーちゃーじゃん'.to_roman).to eq 'sa-cha-jan'
  end

  it "平仮名 to 片仮名", :aggregate_failures do
    expect("ともえまみ".hiragana_to_katakana).to eq "トモエマミ"
    expect("まどまぎ".hiragana_to_katakana(ignore: "ど")).to eq "マどマギ"
  end
end
