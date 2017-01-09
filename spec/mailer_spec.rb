require 'build-notifications/mailer'

module BuildNotifications
  describe Mailer do
    it 'can send an email' do
      skip "don't send an email everytime the tests are run" do
        mailer = Mailer.new("gmail-smtp-in.l.google.com", 25, "yves.bonjour@gmail.com")
        mailer.send("yves.bonjour@gmail.com", "Testemail", "Test Mail Body")
      end
    end
  end
end