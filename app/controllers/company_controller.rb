class CompanyController < ApplicationController

  def edit
    @company = Company.find(21)
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      redirect_to root_path
    else
      render 'edit'
    end
  end


end
