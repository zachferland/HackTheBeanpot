require 'bitpay'

class PagesController < ApplicationController

  before_filter :init
  def init
    @brew = false;
  end



  def index

  end


  def welcome

  end


  def coffee


  end

  def pay
    # embebed form in this page, check for request back to page that transaction has completed, once it has, send request to arduino
    # and who message ready to brew, add cup, design it all nice and shit

    # create invoice here and get the url to embed 
    # client = BitPay::Client.new 'hzy3m1YGPruUtvQoSoj9waSQQqvZOsESUdAjZ4VrrY'

    # need https url to give a return request
    @invoice = @bp.post 'invoice', {:price => 0.10, :currency => 'USD', :transactionSpeed => "high", :notificationURL => "https://localhost:3000/confirm", :fullNotifications => true}

    # append &view=iframe
    @invoice_url = @invoice["url"] + "&view=iframe"

    invoice_id = @invoice["id"];

    @status_url = "http://localhost:3000/status"

    $global = invoice_id

    $notrecieved = true;
    
  end

  def status
    if ($notrecieved) 
    # checks for payment here and then sends reuest (true) to arduino
    status = @bp.get 'invoice/' + $global

    if ((status["status"] == "confirmed") or $tip)
      render :text=> "{1}"
      # render :json=> {:brew => 1}
      $tip = false;
      $notrecieved = false;
    else 
      render :text=> "{0}"
      # render :json=> {:brew => 0}
    end 
    end
  end

  def machine_endpoint
    # sets a value here for the mahcine to be able to check if a payment was accepted to make coffee
    # sends here if tip seletect or payment confiremd
    # so maybe just set once the you are ready to brew page comes up

    # machine makes requests here, and then returns brew to machine
  end

  # only start polling once an invoice is create

end


# should I make a invoice on the coffee page, and then link the button to the url or should I put it on the next page, gets it and shows it (latter)