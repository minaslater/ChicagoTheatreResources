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
    interpreter_to_update.update(interpreter_params)
    interpreter_to_update.emails.update(email_params)
    interpreter_to_update.phones.update(phone_params)
    redirect_to action: "index"
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
end
