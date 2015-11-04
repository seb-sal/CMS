class CompanyContactsController < ApplicationController
  # before_action :authenticate, only: [:index, :show, :edit, :update, :destroy]


  def index
    @company_contacts = CompanyContact.all
  end

  def new
    @company_contact = CompanyContact.new
  end

#   def show
#     @company = Company.find(params[:id])
#   end

def edit
@company_contact = CompanyContact.find(params[:id])
end

  def create
    @company_contact = CompanyContact.new(company_contact_params)
    if @company_contact.save
      flash[:notice] = "The company has been created"
      redirect_to company_contacts
    else
      render 'new'
    end
  end

  def update
    @company_contact = CompanyContact.find(params[:id])

    if @company_contact.update(company_contact_params)
      flash[:notice] = "The company has been updated created"
      redirect_to company_contacts
    else
      render 'edit'
    end
  end

  def destroy
    @company_contact = CompanyContact.find(params[:id])
    @company_contact.destroy
    redirect_to company_contacts
  end

private
  def company_params
    params.require(:company).permit(:company_contact_id,
                                    :profile_pic_uri,
                                    :name,
                                    :email,
                                    :office_number,
                                    :cellphone_number,
                                    :job_title,
                                    :company_id)
  end


#     # def authenticate
#     #   redirect_to '/login', alert: "You must login to continue!" if @current_company.nil?
#     # end
end
