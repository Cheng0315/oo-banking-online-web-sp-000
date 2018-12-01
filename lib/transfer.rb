class Transfer
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @status = "pending"
    @receiver = receiver
    @amount = amount
  end

  def valid?
    @sender.valid? == true && @receiver.valid? == true
  end

  def execute_transaction
    if self.valid? == true
      @receiver.deposit(@amount)
      @sender.balance -= @amount
      self.status = "complete"
    else
      "Transaction rejected. Please check your account balance."
    end
  end
end
