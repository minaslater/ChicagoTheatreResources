module Contactable
  def update_email_phone(email_params, phone_params)
    update_email(email_params)
    update_phone(phone_params)
  end

  def create_email_phone(email_params, phone_params)
    self.email = Email.create(email_params) unless email_params[:address].empty?
    self.phone = Phone.create(phone_params) unless phone_params[:number].empty?
  end

  private

  def update_email(email_params)
    if email && email_params[:address].empty?
      email.destroy
    elsif email && email.address != email_params[:address]
      email.update(email_params)
    elsif email.nil? && email_params[:address] != ""
      self.email = Email.create(email_params)
    end
  end

  def update_phone(phone_params)
    if phone && phone_params[:number].empty?
      phone.destroy
    elsif phone && phone.number != phone_params[:number]
      phone.update(phone_params)
    elsif phone.nil? && phone_params[:number] != ""
      self.phone = Phone.create(phone_params)
    end
  end
end
