class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  $global = "oh yes"
  $tip = false;
  $notrecieved = false;

  before_action :setup_bp
  def setup_bp
   @bp = BitPay::Client.new 'API KEY GOES HERE'
  end


end
