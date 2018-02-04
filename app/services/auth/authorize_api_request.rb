class Auth::AuthorizeApiRequest
  KEY = :access_token.freeze
  attr_reader :params, :headers

  def initialize(params, headers)
    @params = params
    @headers = headers
  end

  def call
    compare_tokens
  end

  private

  def compare_tokens
    access_token == request_token
  end

  def access_token
    Rails.application.secrets.api_access_token
  end

  def request_token
    params[KEY] || headers[KEY]
  end
end

