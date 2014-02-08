class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  $global = "oh yes"

  before_action :setup_bp
  def setup_bp
   @bp = BitPay::Client.new 'hzy3m1YGPruUtvQoSoj9waSQQqvZOsESUdAjZ4VrrY'
  end


end
