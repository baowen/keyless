class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy, :send_text_message]


  def send_text_message

    puts @reservation.mobile

 #   mobilenumber = @reservation.mobile

    client = Textmagic::REST::Client.new 'benowen', 'UMVvGqt5y6ftjSx0FcGyzyBZJryPRG'

    # Send a text message
    # Any phone number that starts with 999 is a test phone number
    # The phones parameter can contain more than one number (comma delimited)
    params = {phones: @reservation.mobile, text: 'Hello '+@reservation.customername+', The code for your room entry is '+@reservation.pinnumber+' please make a note of this. It will be valid for the next 20 hours'}

    # This next line creates and sends the message
    sent_message = client.messages.create(params)
    puts "The sent message id: #{sent_message.id}"
    puts "The sent message URL: #{sent_message.href}"
    puts ''

    # Read messages sent to your Textmagic account
    # By default, client.replies.list() fetches the last 10 messages you've received
    received_messages = client.replies.list()
    if received_messages.resources.length == 0
      puts 'We haven\'t received any SMS messages with our TextMagic account yet'
    else
       received_messages.resources.each do |rm|
          puts "The received message text: #{rm.text}"
          puts "The message was sent from: #{rm.sender}"
          puts ''
       end
    end
  end

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/customer_view
  def customer_view
    @reservation = Reservation.new
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update

    puts "*************** update"

    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:customername, :location, :roomnumber, :startdatetime, :enddatetime, :pinnumber, :mobile, :cleanername, :roomtype)
    end
end
