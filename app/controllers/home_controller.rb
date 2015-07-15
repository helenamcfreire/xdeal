class HomeController < ApplicationController

  def index

  end

  def filter

    ordereeeers = params['moedas'].map! { |moeda| "#{params['pagamento']}_#{moeda}" }
    @companies = Company.order(ordereeeers).all

    json = @companies.collect do |company|
      {
       'name'  =>  company.name,
       'dolar' =>  ActionController::Base.helpers.number_to_currency(company["#{params['pagamento']}_dolar"], unit: "US$", separator: ",", delimiter: "", format: "%n %u"),
       'euro'  =>  ActionController::Base.helpers.number_to_currency(company["#{params['pagamento']}_euro"], unit: "€", separator: ",", delimiter: "", format: "%n %u"),
       'libra' =>  ActionController::Base.helpers.number_to_currency(company["#{params['pagamento']}_libra"], unit: "£", separator: ",", delimiter: "", format: "%n %u"),
       'peso'  =>  ActionController::Base.helpers.number_to_currency(company["#{params['pagamento']}_peso"], unit: "$", separator: ",", delimiter: "", format: "%n %u")
      }
    end
    render :json => json
  end

end
