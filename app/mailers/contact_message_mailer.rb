class ContactMessageMailer < ActionMailer::Base
  default from: ENV['MAILER_SENDER']

  def new_contact_message(contact_message)
    I18n.with_locale(:es) do
      @contact_message = contact_message
      mail to: 'guau@barkibu.com', reply_to: @contact_message.email
    end
  end
end
