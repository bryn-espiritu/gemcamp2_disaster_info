class Api::BarangaysController < ApplicationController
  def index
    city = Address::CityMunicipality.find(params[:city_municipality_id])
    brgy = city.barangays
    render json: brgy, each_serializer: BarangaySerializer
  end

end
