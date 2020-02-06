
class AdminMailer < ApplicationMailer    
    # send an mail to admin that the registration has initiated
    def send_signup_email()
      from = SendGrid::Email.new(email: 'cabtabproject@gmail.com')
      to = SendGrid::Email.new(email: 'akanshak984@gmail.com')
      subject = 'Registration Initiated'
      content = SendGrid::Content.new(type: 'text/plain', value: 'Hello, 
      We are glad that you have decided to use our app service.
      Your Registration is initiated from our end, We will contact you soon to confirm your registartion.
      Thank-you for your intrest')
      mail = SendGrid::Mail.new(from, subject, to, content)
      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      
    end

    # send an confirmation mail along with invitation to admin that he can share with his/her company
    def send_confirmation_email()
      from = SendGrid::Email.new(email: 'cabtabproject@gmail.com')
      to = SendGrid::Email.new(email: 'akanshak984@gmail.com')
      subject = 'Registration confirmed'
      content = SendGrid::Content.new(type: 'text/plain', value: '
      Hello,
      We are happy to share with you that Your Registration has been confirmed.
      This is your invitation link: link, you can share it with your company employees.
      Hope you and your company enjoy using our App.
      Thank-you, Have a great day!!!')
      mail = SendGrid::Mail.new(from, subject, to, content)
      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
    
    end

    # send a rejection mail to admin that his/her registration has been rejected.
    def send_rejection_email()
      from = SendGrid::Email.new(email: 'cabtabproject@gmail.com')
      to = SendGrid::Email.new(email: 'akanshak984@gmail.com')
      subject = 'Registration could not be confirmed'
      content = SendGrid::Content.new(type: 'text/plain', value: '
      Hello, 
      This is to inform you that your registration could not be confirmed.
      Thank-you!')
      mail = SendGrid::Mail.new(from, subject, to, content)
      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
    
    end

end
