class Api::BarangaysController < ApplicationController
  def index
    brgy = Address::Barangay.all
    render json: brgy, each_serializer: BarangaySerializer
  end

end
