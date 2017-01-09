module BuildNotifications
  class Mailer
    require "mail"

    def initialize(smtp_host, smtp_port, sender)
      @smtp_host = smtp_host
      @smtp_port = smtp_port
      @sender = sender

      Mail.defaults do
        delivery_method :smtp, address: smtp_host, port: smtp_port
      end
    end

    def send(to, subject, body)
      from = @sender
      Mail.deliver do
        from     from
        to       to
        subject  subject
        body     body
      end
    end
  end
end