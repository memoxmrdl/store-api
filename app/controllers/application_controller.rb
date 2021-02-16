class ApplicationController < ActionController::Base
  before_action :authenticate_via_token

  protected

  def authenticate_via_token
    authenticate_or_request_with_http_token do |token, _|
      @current_account ||= Account.find_by(api_key: token)
    end
  end
end
