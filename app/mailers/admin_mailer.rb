class AdminMailer < ApplicationMailer    

  def send_signup_email(recipient, username)
    @username = username
    attachments["email.jpg"] = File.read(Rails.root.join("app/assets/images/email.jpg"))
    mail(to: recipient, subject: "Registration Initiated")
  end

  def send_confirmation_email(recipient, username, link)
    @username = username
    @link = link
    attachments["email.jpg"] = File.read(Rails.root.join("app/assets/images/email.jpg"))
    mail(to: recipient, subject: "Registration Confirmed")
  end

  def send_rejection_email(recipient, username)
    @username = username
    attachments["email.jpg"] = File.read(Rails.root.join("app/assets/images/email.jpg"))
    mail(to: recipient, subject: "Registration Rejected")
  end
  
end

