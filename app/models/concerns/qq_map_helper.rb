module QqMapHelper
  KEY = Rails.application.credentials.dig(:qq_map, :ws)
  extend self

  def geocoder(lat:, lng:)
    url = 'https://apis.map.qq.com/ws/geocoder/v1'
    body = {
      key: KEY,
      location: [lat, lng].join(',')
    }

    r = HTTPX.get(url, params: body)
    result = JSON.parse(r.to_s)
    if result['status'] == 0
      result['result']
    else
      result
    end
  end

end
