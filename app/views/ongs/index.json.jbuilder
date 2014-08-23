json.array!(@ongs) do |ong|
  json.extract! ong, :id, :name, :street1, :street2, :city, :state, :country, :zip, :country, :phone, :email, :website, :facebook, :national_network, :international_network, :comments
  json.url ong_url(ong, format: :json)
end
