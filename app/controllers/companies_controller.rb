class CompaniesController < ApplicationController
  # before_action :authenticate, only: [:index, :show, :edit, :update, :destroy]


  def index
    @companies = Company.all

    if params[:search]
      @companies = Company.search(params[:search]).order(:created_at).reverse
    else
      @companies = Company.order(:created_at).reverse
    end
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

  def import
    @company = Company.import(params[:file])
    redirect_to companies_path, notice: "Companies Added Successfully"
  end

#   def export
#     @company = Company.order(:name)
#     respond_to do |format|
#       format.html
#       format.csv { send_data @companies.to_csv }
#       format.xls #{ send_data @compnaies.to_csv(col_sep: "\t") }
#   end
# end

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
