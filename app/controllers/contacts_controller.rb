class ContactsController < ApplicationController
  # before_action :authenticate, only: [:index, :show, :edit, :update, :destroy]


  def index

    if params[:company_id]
      @company  = Company.find(params[:company_id])
      @contacts = @company.contacts
    else
      @contacts = Contact.all
    end

    # if params[:search]
    #   @company_contacts = Contact.search(params[:search]).order("created_at DESC")
    # else
    #   @company_contacts = Contact.order("created_at DESC")
    # end
  end

  def new
    @company = Company.find(params[:company_id])
    @contact = Contact.new
  end

  def edit
    @company_contact = Contact.find(params[:id])
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.build(contact_params)

    if @contact.save
      flash[:notice] = "The company has been created"
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def update
    @company_contact = Contact.find(params[:id])

    if @company_contact.update(contact_params)
      flash[:notice] = "The company has been updated created"
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  def destroy
    @company_contact = Contact.find(params[:id])
    @company_contact.destroy
    redirect_to contacts_path
  end

private
  def contact_params
    params.require(:contact).permit(:name,
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
