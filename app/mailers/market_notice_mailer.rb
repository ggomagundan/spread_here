class MarketNoticeMailer < ActionMailer::Base

  default from: "spreadherenow@gmail.com"



  def market_apply(market)
    @market = market
    if Rails.env == "development"
      mail(to: "spreadherenow@gmail.com", subject: "[TEST] #{market.market_name} Apply" )
    else
      mail(to: "spreadherenow@gmail.com", subject: "#{market.market_name} Apply" )
    end
  end

end
