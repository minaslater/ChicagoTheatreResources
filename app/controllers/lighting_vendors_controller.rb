class LightingVendorsController < ApplicationController
  def index
    @vendors = LightingVendor.all
  end

  def show
    @vendor = LightingVendor.find(params[:id])
  end

  def new
    @lighting_vendor = LightingVendor.new
    @email = Email.new
    @phone = Phone.new
    @address = Address.new
    @contact = Contact.new
    render "form"
  end

  def edit
    @lighting_vendor = LightingVendor.find(params[:id])
    @email = @lighting_vendor.emails.first
    @phone = @lighting_vendor.phones.first
    @address = @lighting_vendor.addresses.first
    @contact = @lighting_vendor.contacts.first
    render "form"
  end

  def create
    new_vendor = LightingVendor.create(rehearsal_space_params)
    new_vendor.emails.create(email_params)
    new_vendor.phones.create(phone_params)
    new_vendor.addresses.create(address_params)
    new_vendor.contacts.create(contact_params)
    redirect_to action: "index"
  end

  def update
    vendor_to_update = LightingVendor.find(params[:id])
    vendor_to_update.update(lighting_vendor_params)
    vendor_to_update.emails.update(email_params)
    vendor_to_update.phones.update(phone_params)
    vendor_to_update.addresses.update(address_params)
    vendor_to_update.contacts.update(contact_params)
    redirect_to action: "index"
  end

  def destroy
    render plain: "destroy"
  end

  private

  def lighting_vendor_params
    params.require(:lighting_vendor).permit(:name, :deliver, :rental, :sales)
  end

  def email_params
    params.require(:lighting_vendor).permit(email: :address)["email"]
  end

  def phone_params
    params.require(:lighting_vendor).permit(phone: :number)["phone"]
  end

  def address_params
    params.require(:lighting_vendor).permit(address: [:street1, :street2, :city, :state, :zip_code])[:address]
  end

  def contact_params
    params.require(:lighting_vendor).permit(contact: :name)[:contact]
  end
end
