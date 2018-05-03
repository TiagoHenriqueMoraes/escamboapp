class AdminMailer < ApplicationMailer
    default from: "noreply@example.com" #email padrao de quem sera a pessoa q "enviou"
    layout "mailer"
    def update_email(current_admin, admin)
        @current_admin = current_admin
        @admin = admin
        mail(to: @admin.email, subject: "Your informations was changed!")
    end

    def send_message(current_admin, recipient, subject, message) 
        @current_admin = current_admin
        @recipient = recipient 
        @subject = subject
        @message = message
        mail(to: @recipient, subject: @subject)
    end
end
