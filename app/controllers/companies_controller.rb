class CompaniesController < ApplicationController
  # before_action :authenticate, only: [:index, :show, :edit, :update, :destroy]


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
@company = Company.find(params[:id])
end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "The company has been created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      flash[:notice] = "The company has been updated created"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to '/'
  end

private
  def company_params
    params.require(:company).permit(:count,
                                    :logo,
                                    :company_name,
                                    :company_size,
                                    :company_type,
                                    :telephone,
                                    :logo_uri,
                                    :fax,
                                    :address,
                                    :city,
                                    :state,
                                    :country,
                                    :zip_code,
                                    :website_uri,
                                    :facebook_uri,
                                    :email,
                                    :linkedin_uri)
  end


    # def authenticate
    #   redirect_to '/login', alert: "You must login to continue!" if @current_company.nil?
    # end
end
