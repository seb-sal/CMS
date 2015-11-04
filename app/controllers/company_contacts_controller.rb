class CompanyContactsController < ApplicationController
  # before_action :authenticate, only: [:index, :show, :edit, :update, :destroy]


  def index
    @company_contacts = CompanyContact.all

    if params[:search]
      @company_contacts = CompanyContact.search(params[:search]).order("created_at DESC")
    else
      @company_contacts = CompanyContact.order("created_at DESC")
    end
  end

  def new
    @company_contact = CompanyContact.new
  end

  def edit
  @company_contact = CompanyContact.find(params[:id])
  end

  def create
    @company_contact = CompanyContact.new(company_contact_params)
    if @company_contact.save
      flash[:notice] = "The company has been created"
      redirect_to company_contacts_path
    else
      render 'new'
    end
  end

  def update
    @company_contact = CompanyContact.find(params[:id])

    if @company_contact.update(company_contact_params)
      flash[:notice] = "The company has been updated created"
      redirect_to company_contacts_path
    else
      render 'edit'
    end
  end

  def destroy
    @company_contact = CompanyContact.find(params[:id])
    @company_contact.destroy
    redirect_to company_contacts_path
  end

private
  def company_contact_params
    params.require(:company_contact).permit(:name,
                                    :email,
                                    :office_number,
                                    :cellphone_number,
                                    :job_title,
                                    :profile_pic_uri,
                                    :company_contact_id,
                                    :company_id)
  end


#     # def authenticate
#     #   redirect_to '/login', alert: "You must login to continue!" if @current_company.nil?
#     # end
end
