class InterpretersController < ApplicationController
  def index
    @interpreters = Interpreter.all
  end

  def show
    @interpreter = Interpreter.find(params[:id])
  end

  def new
    @interpreter = Interpreter.new
    @email = Email.new
    @phone = Phone.new
    render "form"
  end

  def edit
    @interpreter = Interpreter.find(params[:id])
    @email = @interpreter.email || Email.new
    @phone = @interpreter.phone || Phone.new
    render "form"
  end

  def create
    new_interpreter = Interpreter.create(interpreter_params)
    if new_interpreter.errors.messages.empty?
      create_email_phone(new_interpreter)
      flash[:notice] = "Interpreter saved"
      redirect_to action: "index"
    else
      flash[:alert] = "Womp womp..."
      redirect_to :back
    end
  end

  def update
    interpreter_to_update = Interpreter.find(params[:id])
    interpreter_to_update.update(interpreter_params)
    if interpreter_to_update.errors.messages.empty?
      update_email_phone(interpreter_to_update)
      flash[:notice] = "Update successful!"
      redirect_to action: "index"
    else
      flash[:alert] = "Oops, something went wrong."
      redirect_to :back
    end
  end

  def destroy
    render plain: "destroy"
  end

  private

  def interpreter_params
    params.require(:interpreter)
          .permit(:first_name,
                  :last_name,
                  :accreditation,
                  :rehearsal_avail,
                  :performance_avail)
  end

  def email_params
    params.require(:interpreter).permit(email: :address)["email"]
  end

  def phone_params
    params.require(:interpreter).permit(phone: :number)["phone"]
  end

  def update_email(interpreter)
    if interpreter.email && email_params[:address] == ""
      interpreter.email.destroy
    elsif interpreter.email && interpreter.email.address != email_params[:address]
      interpreter.email.update(email_params)
    elsif interpreter.email.nil? && email_params[:address] != ""
      interpreter.email = Email.create(email_params)
    end
  end

  def update_phone(interpreter)
    if interpreter.phone && phone_params[:number] == ""
      interpreter.phone.destroy
    elsif interpreter.phone && interpreter.phone.number != phone_params[:number]
      interpreter.phone.update(phone_params)
    elsif interpreter.phone.nil? && phone_params[:number] != ""
      interpreter.phone = Phone.create(phone_params)
    end
  end

  def update_email_phone(interpreter)
    update_email(interpreter)
    update_phone(interpreter)
  end

  def create_email_phone(interpreter)
    interpreter.email = Email.create(email_params) unless email_params[:address].empty?
    interpreter.phone = Phone.create(phone_params) unless phone_params[:number].empty?
  end
end
