class Google::PlacesController < ApplicationController

  def spots
    if spots_request.errors.present?
      return render json: { errors: spots_request.errors }, status: 422
    end

    person = client.spots spots_request.params[:lat], spots_request.params[:lng], types: spots_request.params[:types]

    render json: person
  end

  private

  def spots_request
    GooglePlacesSpotRequest.new request.query_parameters
  end

  def client
    @client ||= GooglePlaces::Client.new ENV['GOOGLE_KEY']
  end

end
