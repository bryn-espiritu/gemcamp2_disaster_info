class Api::BarangaysController < ApplicationController
  brgy = Address::Barangay.all
  render json: brgy, each_serializer: BarangaySerializer
end
