class AddressesController < ApplicationController
  def cities
    @target = params[:target]
    @cities = ::BrAddress::State.cities(state_code: params[:state])

    respond_to do |format|
      format.turbo_stream
    end
  end
end
