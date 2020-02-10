class AdminMailer < ApplicationMailer    
  # # send an mail to admin that the registration has initiated
  # def send_signup_email_test()
  #   from ='cabtabproject@gmail.com'
  #   to = 'akanshak984@gmail.com'
  #   subject = 'Registration Initiated'
  #   content = 'Hello,
  #   We are glad that you have decided to use our app service.
  #   Your Registration is initiated from our end, We will contact you soon to confirm your registartion.
  #   Thank-you for your intrest'
  #   mail(to: to, subject: subject, body: content)
  # end

  # def send_confirmation_email_test()
  #   from ='cabtabproject@gmail.com'
  #   to = 'akanshak984@gmail.com'
  #   subject = 'Registration Initiated'
  #   content = 'Hello,
  #   We are happy to share with you that Your Registration has been confirmed.
  #   This is your invitation link: link, you can share it with your company employees.
  #   Hope you and your company enjoy using our App.
  #   Thank-you, Have a great day!!!'
  #   mail(to: to, subject: subject, body: content)
  # end

  # def send_rejection_email_test()
  #   from ='cabtabproject@gmail.com'
  #   to = 'akanshak984@gmail.com'
  #   subject = 'Registration Initiated'
  #   content = ' Hello,
  #   This is to inform you that your registration could not be confirmed.
  #   Thank-you!'
  #   mail(to: to, subject: subject, body: content)
  # end

  def send_signup_email(to, name)
    @name = name
    mail(to: to, subject: "Registration Initiated")
  end

  def send_confirmation_email(to, name, link)
    @name = name
    @link = link
    mail(to: to, subject: "Registration Confirmed")
  end

  def send_rejection_email(to, name)
    @name = name
    mail(to: to, subject: "Registration Rejected")
  end
  
end

