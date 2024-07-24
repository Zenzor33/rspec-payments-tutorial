class Payment
  attr_accessor :total_cents

  def initialize(payment_gateway, logger)
    @payment_gateway = payment_gateway
    @logger = logger
  end

  def save
    response = @payment_gateway.charge(total_cents)
    @logger.record_payment(response[:payment_id])
  end
end

class PaymentGateway
  def charge(total_cents)
    puts "THIS HITS THE PRODUCTION API AND ALTERS PRODUCTION DATA. THAT'S BAD!"

    { payment_id: rand(1000) }
  end
end

class Logger
  def record_payment(payment_id)
    puts "Payment id: #{payment_id}"
  end
end
