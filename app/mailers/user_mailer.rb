class UserMailer < ApplicationMailer
  default from: "donotreply@transiencellc.herokuapp.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
          to: 'khuggins22@gmail.com',
          subject: "A new contact form message from #{name}")
  end
end
