class ApplicationMailer < ActionMailer::Base
  default from: 'donotreply@transiencellc.herokuapp.com'
  layout 'mailer'
end
