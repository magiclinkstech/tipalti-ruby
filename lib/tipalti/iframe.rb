module Tipalti
  class Iframe

    PAGES = {
      home: "Home",
      invoices: "Invoices",
      payments: "PaymentsHistory"
    }

    # https://support.tipalti.com/Content/Topics/Development/iFrames/IframeRequestStructure.htm
    def self.url(params = {})
      page = (params.delete(:page) || "home").to_sym
      param_str = params.merge(payer: params[:payer] || Tipalti.configuration.payer, ts: Time.now.to_i).to_query
      hashkey = OpenSSL::HMAC.hexdigest('sha256', Tipalti.configuration.master_key, param_str)
      "#{Tipalti.configuration.url}/PayeeDashboard/#{PAGES[page]}?#{param_str}&hashkey=#{hashkey}"
    end

  end
end