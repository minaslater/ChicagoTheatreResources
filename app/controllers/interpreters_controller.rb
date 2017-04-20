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
    new_interpreter = Interpreter.create(interpreter_params)
    new_interpreter.emails.create(email_params)
    new_interpreter.phones.create(phone_params)
    redirect_to action: "index"
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
