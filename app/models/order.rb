class Order < ActiveRecord::Base
  belongs_to :employee

  delegate :signup_date, to: :employee, prefix: true

  scope :recent_orders_by_employees_signup, lambda {
    in_last_days.by_signup_date
  }

  scope :in_last_days, lambda { |num=90|
    where(created_at: num.days.ago..Time.now)
  }

  scope :by_signup_date, lambda {
    joins(:employee).order("employees.signup_date DESC")
  }

end
