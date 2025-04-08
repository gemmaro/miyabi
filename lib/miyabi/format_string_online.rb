require 'net/http'
require 'nokogiri'

module Miyabi::FormatStringOnline
  def to_kanhira
    http = Net::HTTP.new('yomikatawa.com', 443)
    http.use_ssl = true
    path = File.join('/kanji', self)
    html = http.get(path).body
    Nokogiri::HTML(html).search('#yomikata tbody tr td').first.inner_text
  end
end
