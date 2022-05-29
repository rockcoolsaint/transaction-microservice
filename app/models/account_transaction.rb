class AccountTransaction < ApplicationRecord
  belongs_to :user

  after_create :publish_to_dashboard

  def self.output_amount(input_amount, currency)
    if currency != "ngn"
      input_amount * ENV["FX_#{currency.upcase}"].to_d || Fx.where(currency: currency)[0].rate
    else
      input_amount / ENV["FX_#{currency.upcase}"].to_d || Fx.where(currency: currency)[0].rate
    end
  end

  private
  def publish_to_dashboard
    "=====published to rabbitmq-server====="
    Publisher.publish('transactions', :timestamp => Time.now.to_i,
    :routing_key => "process")
  end
end
