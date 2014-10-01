class ContactMessagesController < ApplicationController
  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new params[:contact_message]

    if @contact_message.valid?
      ContactMessageMailer.delay.new_contact_message(@contact_message)
      redirect_to root_path, notice: t('.notice')
    else
      flash.now.alert = t('.alert')
      render :new
    end
  end
end
