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
      new_interpreter.create_email_phone(email_params, phone_params)
      flash[:notice] = "Interpreter saved"
      redirect_to action: "index"
    else
      flash[:alert] = "Womp womp..."
      redirect_to :back
    end
  end

  def update
    interpreter = Interpreter.find(params[:id])
    interpreter.update(interpreter_params)
    if interpreter.errors.messages.empty?
      interpreter.update_email_phone(email_params, phone_params)
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
end
