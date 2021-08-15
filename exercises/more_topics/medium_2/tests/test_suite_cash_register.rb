require 'minitest/autorun'

require_relative '../cash_register'
require_relative '../transaction'

class CashRegisterSuite < Minitest::Test
  attr_accessor :register, :transaction

  def setup # may fail if Transaction broken
    self.register = CashRegister.new(100.00)
    self.transaction = Transaction.new(20.00)
    self.transaction.amount_paid = 25.00
  end

  def test_accept_money  # may fail if Transaction broken
    register.accept_money(transaction)
    assert_equal(125.00, register.total_money) # may fail if total_money broken
  end

  def test_change
    assert_equal(5.00, register.change(transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{transaction.item_cost}.\n") { register.give_receipt(transaction) }
  end
end

class TransactionSuite < Minitest::Test
  attr_accessor :register, :transaction

  def setup # may fail if CashRegister broken
    self.register = CashRegister.new(100.00)
    self.transaction = Transaction.new(20.00)
  end

  def test_prompt_for_payment
    input_string = StringIO.new("25\n")
    transaction.prompt_for_payment(input: input_string, output: StringIO.new)
    assert_equal(25.0, transaction.amount_paid)
  end
end