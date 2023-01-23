module SavingsAccount
  def self.interest_rate(balance)
    if balance.negative?
      3.213
    elsif balance >= 5000
      2.475
    elsif balance >= 1000
      1.621
    else
      0.5
    end
  end

  def self.annual_balance_update(balance)
    balance + balance * interest_rate(balance) * 0.01
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    calculated_balance = current_balance
    while calculated_balance <= desired_balance
      calculated_balance = annual_balance_update(calculated_balance)
      years += 1
    end
    years
  end
end
