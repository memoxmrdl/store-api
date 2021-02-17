class ApplicationController < ActionController::Base
  before_action :authenticate_via_token

  protected

  def authenticate_via_token
    authenticate_or_request_with_http_token do |token, _|
      account = Account.find_by(api_key: token)

      ActiveSupport::SecurityUtils.secure_compare(token, account&.api_key.to_s)
    end
  end
end
