class SearchController < ApplicationController
  include Pagy::Backend

  def search
    @results = Citizen.pagy_search(params[:search])

    @results = Citizen.pagy_search("*") if params[:search].blank?

    @pagy, @citizens = pagy_searchkick(@results, items: 15)

    render turbo_stream:
      turbo_stream.update('citizens',
        partial: 'citizens/citizens',
        locals: { citizens: @citizens, pagy: @pagy })
  end
end
