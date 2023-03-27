class ContactsController < ApplicationController
  
  def new
    @contacts = Contact.all
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: "お問い合わせ受け付けました"
    else
      redirect_to new_contact_path, notice: "お問い合わせ受け付けました"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
