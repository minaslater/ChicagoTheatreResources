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
    @email = @interpreter.emails.first
    @phone = @interpreter.phones.first
    render "form"
  end

  def create
    new_interpreter = Interpreter.new(interpreter_params)
    if new_interpreter.save
      new_email = new_interpreter.emails.new(email_params)
      new_phone = new_interpreter.phones.new(phone_params)
      new_email.save if new_email.valid?
      new_phone.save if new_phone.valid?
      flash[:notice] = "Interpreter saved"
      redirect_to action: "index"
    else
      flash[:alert] = "Womp womp..."
      redirect_to :back
    end
  end

  def update
    interpreter_to_update = Interpreter.find(params[:id])
    interpreter_to_update.assign_attributes(interpreter_params)
    if interpreter_to_update.save
      update_email(interpreter_to_update)
      update_phone(interpreter_to_update)
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
    params.require(:interpreter).permit(:first_name, :last_name, :accreditation, :rehearsal_avail, :performance_avail)
  end

  def email_params
    params.require(:interpreter).permit(email: :address)["email"]
  end

  def phone_params
    params.require(:interpreter).permit(phone: :number)["phone"]
  end

  def update_email(interpreter)
    if interpreter.emails
      interpreter.emails.update(email_params)
    else
      new_email = new_interpreter.emails.new(email_params)
      new_email.save if new_email.valid?
    end
  end

  def update_phone(interpreter)
    if interpreter.phones
      interpreter.phones.update(phone_params)
    else
      new_phone = new_interpreter.phones.new(phone_params)
      new_phone.save if new_email.valid?
    end
  end
end
