# encoding: utf-8
require 'open-uri'
class JooinWorker

  def perform

    main_url = 'http://jooin.com.br/companies/search/RJ'

    urls = ['/money/usdbrl.json', '/visa/usdbrl.json', '/master/usdbrl.json',
            '/money/eurbrl.json', '/visa/eurbrl.json', '/master/eurbrl.json',
            '/money/gbpbrl.json', '/visa/gbpbrl.json', '/master/gbpbrl.json',
            '/money/arsbrl.json', '/visa/arsbrl.json', '/master/arsbrl.json']

    urls.map! { |url| "#{main_url}#{url}" }

    urls.each do |url|

      jooin = open(url).read
      json_companies  = JSON.parse(jooin)['companies']

      json_companies.each do |json_comp|

        company = Company.where(name: json_comp['name'], code: json_comp['company_code']).first

       puts(json_comp['price'])

        if company.nil?
          puts("entrou")
          company = Company.create(
              name: json_comp['name'],
              code: json_comp['company_code'],
              site: json_comp['site'],
              phone: json_comp['phone'],
              delivery: json_comp['delivery'],
              multi_prices: json_comp['multi_prices']
          )
        end

       company.date_display = DateTime.iso8601(json_comp['date_iso8601'])

        preco_formatado = json_comp['price'].gsub(',', '.')

        if url.include? '/money/usdbrl.json'
          company.money_dolar = preco_formatado
        elsif url.include? '/visa/usdbrl.json'
          company.visa_dolar = preco_formatado
        elsif url.include? '/master/usdbrl.json'
          company.master_dolar = preco_formatado
        elsif url.include? '/money/eurbrl.json'
          company.money_euro = preco_formatado
        elsif url.include? '/visa/eurbrl.json'
          company.visa_euro = preco_formatado
        elsif url.include? '/master/eurbrl.json'
          company.master_euro = preco_formatado
        elsif url.include? '/money/gbpbrl.json'
          company.money_libra = preco_formatado
        elsif url.include? '/visa/gbpbrl.json'
          company.visa_libra = preco_formatado
        elsif url.include? '/master/gbpbrl.json'
          company.master_libra = preco_formatado
        elsif url.include? '/money/arsbrl.json'
          company.money_peso = preco_formatado
        elsif url.include? '/visa/arsbrl.json'
          company.visa_peso = preco_formatado
        elsif url.include? '/master/arsbrl.json'
          company.master_peso = preco_formatado
        end

        company.save

      end
    end

  end
end
