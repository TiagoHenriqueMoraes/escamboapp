class Backoffice::SendMailController < ApplicationController
   

    def edit
        @admin = Admin.find(params[:id])

        respond_to do |format|
            format.js
        end
    end

    def create
        begin
            AdminMailer.send_message(current_admin, params[:'recipient-name'], params[:'subject-text'],params[:'message-text']).deliver_now
            @notify_message = "Email Successeful sended"
            @notify_flag = "success"
        rescue
            @notify_message = "Error sending email"
            @notify_flag = "error"
        end
        respond_to do |format| 
            format.js
        end
    end
end
