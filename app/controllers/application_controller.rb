class ApplicationController < ActionController::API
  before_action :authorize_request

  private

  def authorize_request
    unless Auth::AuthorizeApiRequest.new(request.params, request.headers).call
      render json: { error: 'authentication error' }, status: 403
    end
  end
end
