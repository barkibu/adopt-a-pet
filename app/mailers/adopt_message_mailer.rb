class AdoptMessageMailer < ActionMailer::Base
  default from: ENV['MAILER_SENDER']

  def new_adopt_message(adopt_message, pet_user, pet_name_formatted, pet_adopt_specie_url)
    I18n.with_locale(:es) do
      @adopt_message = adopt_message
      @email_to = pet_user.try(:email)
      @pet_name_formatted = pet_name_formatted
      @pet_adopt_specie_url = pet_adopt_specie_url
      subject = I18n.t("adopt_message_mailer.new_adopt_message.subject", name: @pet_name_formatted)
      mail(
        subject: subject,
        to: @email_to,
        bcc: "guau@barkibu.com"
      )
    end
  end
end
