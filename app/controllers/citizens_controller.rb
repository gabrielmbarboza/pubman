class CitizensController < ApplicationController
  include Pagy::Backend

  before_action :set_citizen, only: %i[ show edit update ]
  before_action :ensure_frame_response, only: [:new, :edit]

  # GET /citizens or /citizens.json
  def index
    @pagy, @citizens = pagy(Citizen.all, items: 15)
  end

  # GET /citizens/1 or /citizens/1.json
  def show
  end

  # GET /citizens/new
  def new
    @citizen = Citizen.new
    @citizen.build_address
  end

  # GET /citizens/1/edit
  def edit
  end

  # POST /citizens or /citizens.json
  def create
    @citizen = Citizen.new(citizen_params)

    respond_to do |format|
      if @citizen.save
        message = I18n.t('notification.citizen.created')

        # unless Rails.env.test? do
        #   ::NotificationService.new(:email, @citizen.email, message).call
        #   ::NotificationService.new(:sms, @citizen.phone, message).call
        # end

        format.turbo_stream { render turbo_stream: turbo_stream.prepend("citizen-list", partial: 'citizens/citizen', locals: { citizen: @citizen }) }
        format.html { redirect_to action: :index, notice: "Citizen was successfully created." }
        format.json { render :show, status: :created, location: @citizen }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citizens/1 or /citizens/1.json
  def update
    respond_to do |format|
      if @citizen.update(citizen_params)
        message = I18n.t('notification.citizen.updated')

        # unless Rails.env.test? do
        #   ::NotificationService.new(:email, @citizen.email, message).call
        #   ::NotificationService.new(:sms, @citizen.phone, message).call
        # end

        format.turbo_stream { render turbo_stream: turbo_stream.replace("ctz-#{@citizen.id}", partial: "citizens/citizen", locals: { citizen: @citizen }) }
        format.html { redirect_to action: :index, notice: "Citizen was successfully updated." }
        format.json { render :show, status: :ok, location: @citizen }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_citizen
    @citizen = Citizen.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def citizen_params
    params.require(:citizen).permit(
      :full_name, :cpf, :cns, :email, :date_of_birth, :phone, :status, :photo,
      address_attributes: [ :id, :zip_code, :street, :address_number, :complement,
                              :neighborhood, :city, :state, :ibge_code ])
  end

  def ensure_frame_response
    return unless Rails.env.development?

    redirect_to root_path unless turbo_frame_request?
  end
end
