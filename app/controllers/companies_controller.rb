class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

def edit
end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "You have successfully signed up!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to '/'
  end

private
  def company_params
    params.require(:company).permit(:count, :company_name, :telephone, :website, :city, :state, :country)
  end

end
