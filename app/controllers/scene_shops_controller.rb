class SceneShopsController < ApplicationController
  def index
    @scene_shops = SceneShop.all
  end

  def show
    @shop = SceneShop.find(params[:id])
  end

  def new
    @scene_shop = SceneShop.new
    @phone = Phone.new
    @email = Email.new
    @address = Address.new
    @contact = Contact.new
    render "form"
  end

  def edit
    @scene_shop = SceneShop.find(params[:id])
    @phone = @scene_shop.phones.first
    @email = @scene_shop.emails.first
    @address = @scene_shop.addresses.first
    @contact = @scene_shop.contacts.first
    render "form"
  end

  def create
    new_shop = SceneShop.create(scene_shop_params)
    new_shop.emails.create(email_params)
    new_shop.phones.create(phone_params)
    new_shop.addresses.create(address_params)
    new_shop.contacts.create(contact_params)
    redirect_to action: "index"
  end

  def update
    render plain: "update"
  end

  def destroy
    render plain: "destroy"
  end

  private

  def scene_shop_params
    params.require(:scene_shop).permit(:name, :website)
  end

  def phone_params
    params.require(:scene_shop).permit(phone: :number)["phone"]
  end

  def email_params
    params.require(:scene_shop).permit(email: :address)["email"]
  end

  def address_params
    params.require(:scene_shop).permit(address: [:street1, :street2, :city, :state, :zip_code])[:address]
  end

  def contact_params
    params.require(:scene_shop).permit(contact: :name)[:contact]
  end
end
