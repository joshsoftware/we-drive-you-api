class AdminMailer < ApplicationMailer    
 
  def send_signup_email(to, name)
    @name = name
    attachments["email.jpg"] = File.read(Rails.root.join("app/assets/images/email.jpg"))
    mail(to: to, subject: "Registration Initiated")
  end

  def send_confirmation_email(to, name, link)
    @name = name
    @link = link
    attachments["email.jpg"] = File.read(Rails.root.join("app/assets/images/email.jpg"))
    mail(to: to, subject: "Registration Confirmed")
  end

  def send_rejection_email(to, name)
    @name = name
    attachments["email.jpg"] = File.read(Rails.root.join("app/assets/images/email.jpg"))
    mail(to: to, subject: "Registration Rejected")
  end
  
end

