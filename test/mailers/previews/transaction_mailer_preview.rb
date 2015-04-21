# Preview all emails at http://localhost:3000/rails/mailers/transaction_mailer

#http://localhost:3000/rails/mailers/example_mailer/sample_mail_preview
class TransactionMailerPreview < ActionMailer::Preview
    def offer_mail_preview
    TransactionMailer.offer_email(2,1,"Comment")
  end

end
