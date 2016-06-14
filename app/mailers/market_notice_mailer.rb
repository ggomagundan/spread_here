class MarketNoticeMailer < ActionMailer::Base

  default from: "spreadherenow@gmail.com"



  def market_apply(market)
    @market = market
    mail(to: "spreadherenow@gmail.com", subject: "[TEST] #{market.market_name} Apply" )
  end

end
