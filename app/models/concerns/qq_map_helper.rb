module QqMapHelper
  KEY = Rails.application.credentials.dig(:qq_map, :key)
  extend self

  def geocoder(lat:, lng:)
    url = 'https://apis.map.qq.com/ws/geocoder/v1'
    body = {
      key: KEY,
      location: [lat, lng].join(',')
    }

    HTTPX.get(url, params: body)
  end

end
