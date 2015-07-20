class CompanyController < ApplicationController

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
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
