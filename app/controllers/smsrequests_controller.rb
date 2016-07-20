class SmsrequestsController < ApplicationController
  before_action :set_smsrequest, only: [:show, :edit, :update, :destroy]

  def getsmslist

      @smsrequests = []

      client = Textmagic::REST::Client.new 'benowen', 'UMVvGqt5y6ftjSx0FcGyzyBZJryPRG'

      received_messages = client.replies.list()
      if received_messages.resources.length == 0
         puts 'We haven\'t received any SMS messages with our TextMagic account yet'
      else
         received_messages.resources.each do |rm|

           request = Smsrequest.new
           request.mobile = rm.sender
           request.message = rm.text
  
           @smsrequests.push(request)
           

           puts "The received message text: #{rm.text}"
           puts "The message was sent from: #{rm.sender}"
           puts ''
       end
    end

    

#      @smsrequests = Smsrequest.all



  end

  # GET /smsrequests
  # GET /smsrequests.json
  def index
    @smsrequests = Smsrequest.all
  end

  # GET /smsrequests/1
  # GET /smsrequests/1.json
  def show
  end

  # GET /smsrequests/new
  def new
    @smsrequest = Smsrequest.new
  end

  # GET /smsrequests/1/edit
  def edit
  end

  # POST /smsrequests
  # POST /smsrequests.json
  def create
    @smsrequest = Smsrequest.new(smsrequest_params)

    respond_to do |format|
      if @smsrequest.save
        format.html { redirect_to @smsrequest, notice: 'Smsrequest was successfully created.' }
        format.json { render :show, status: :created, location: @smsrequest }
      else
        format.html { render :new }
        format.json { render json: @smsrequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smsrequests/1
  # PATCH/PUT /smsrequests/1.json
  def update
    respond_to do |format|
      if @smsrequest.update(smsrequest_params)
        format.html { redirect_to @smsrequest, notice: 'Smsrequest was successfully updated.' }
        format.json { render :show, status: :ok, location: @smsrequest }
      else
        format.html { render :edit }
        format.json { render json: @smsrequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smsrequests/1
  # DELETE /smsrequests/1.json
  def destroy
    @smsrequest.destroy
    respond_to do |format|
      format.html { redirect_to smsrequests_url, notice: 'Smsrequest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smsrequest
      @smsrequest = Smsrequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def smsrequest_params
      params.require(:smsrequest).permit(:mobile, :message)
    end
end
