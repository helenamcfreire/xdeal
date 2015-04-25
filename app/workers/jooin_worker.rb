# encoding: utf-8
require 'open-uri'
class JooinWorker

  def perform
    jooin = open("http://jooin.com.br/companies/search/RJ/money/usdbrl.json").read
    json_companies  = JSON.parse(jooin)['companies']

    json_companies.each do |json_comp|

      company = Company.where(
          name: json_comp['name'],
          code: json_comp['company_code'],
          site: json_comp['site'],
          phone: json_comp['phone'],
          delivery: json_comp['delivery'],
          multi_prices: json_comp['multi_prices'],
          price: json_comp['price'],
          date_display: DateTime.iso8601(json_comp['date_iso8601'])
      ).first_or_create

    end

  end
end
