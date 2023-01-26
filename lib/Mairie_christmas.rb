require 'rspec'
require 'open-uri'
require 'nokogiri'

townhall_url = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/avernes.html"))
townhall_urls = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))


def get_townhall_email(townhall_url)
  townhall_name = townhall_url.xpath("//body/div/header/section/div/div/h1/small").text
  townhall_email = townhall_url.xpath("//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
  hash={townhall_name=>townhall_email}
  puts hash
end

def get_townhall_urls(townhall_urls)
  all_urls=townhall_urls.xpath('//a[contains(@href, "95")]')
  array = []
  all_urls.each do |link|
    array << link['href']
  end
  for link in array
    list="https://www.annuaire-des-mairies.com/#{link}"
  puts list
  end
end


get_townhall_email(townhall_url)
get_townhall_urls(townhall_urls)

