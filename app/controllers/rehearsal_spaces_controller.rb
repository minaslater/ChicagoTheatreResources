class RehearsalSpacesController < ApplicationController
  def index
    @rehearsal_spaces = RehearsalSpace.all
  end

  def show
    @rehearsal_space = RehearsalSpace.find(params[:id])
  end

  def new
    @rehearsal_space = RehearsalSpace.new
    @email = Email.new
    @phone = Phone.new
    @address = Address.new
    render "form"
  end

  def edit
    @rehearsal_space = RehearsalSpace.find(params[:id])
    @email = @rehearsal_space.emails.first
    @phone = @rehearsal_space.phones.first
    @address = @rehearsal_space.addresses.first
    render "form"
  end

  def create
    new_space = RehearsalSpace.create(rehearsal_space_params)
    new_space.emails.create(email_params)
    new_space.phones.create(phone_params)
    new_space.addresses.create(address_params)
    redirect_to action: "index"
  end

  def update
    render plain: "update"
  end

  def destroy
    render plain: "destroy"
  end

  private

  def rehearsal_space_params
    params.require(:rehearsal_space).permit(:name, :cost, :cost_unit, :notes)
  end

  def email_params
    params.require(:rehearsal_space).permit(email: :address)["email"]
  end

  def phone_params
    params.require(:rehearsal_space).permit(phone: :number)["phone"]
  end

  def address_params
    params.require(:rehearsal_space).permit(address: [:street1, :street2, :city, :state, :zip_code])[:address]
  end
end
