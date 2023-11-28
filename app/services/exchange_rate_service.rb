# frozen_string_literal: true

class ExchangeRateService
  require 'net/http'
  API_BANK = 'https://www.cbr.ru/scripts/XML_daily.asp?date_req='

  def self.fetch_and_save_rates(date = Date.current)
    # ! https://www.cbr.ru/scripts/XML_daily.asp?date_req=09/02/2023
    url = URI.parse("#{API_BANK}#{date.strftime('%d/%m/%Y')}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    response = http.request(request)

    if response.code == '200'
      xml_data = Nokogiri::XML(response.body)

      rub_to_usd = xml_data.xpath("//Valute[@ID='R01235']/Value").text.tr(',', '.').to_f
      rub_to_eur = xml_data.xpath("//Valute[@ID='R01239']/Value").text.tr(',', '.').to_f
      rub_to_cny = xml_data.xpath("//Valute[@ID='R01375']/Value").text.tr(',', '.').to_f

      ExchangeRate.create(date:,
                          rub_to_usd:,
                          rub_to_eur:,
                          rub_to_cny:)
    else
      render json: "Ошибка: #{response}"
    end
  end
end
