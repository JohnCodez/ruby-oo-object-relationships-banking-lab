require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else 
      false
    end
  end

  # @@executed_transactions = []

  def execute_transaction
    if self.valid? && sender.balance > amount && self.status == "pending"
      @sender.balance -= amount 
      @receiver.deposit(amount)
      self.status = "complete"
    else 
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    # binding.pry
  end

  def reverse_transfer
    if self.status == "complete"
      @receiver.balance -= amount 
      @sender.deposit(amount)
      self.status = "reversed"
    end
  end

end
# binding.pry