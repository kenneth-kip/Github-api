module ApiClient
  extend ActiveSupport::Concern

  def fetch_github_info(url, headers = {})
    headers = { accept: :json }.merge(headers)
    result = RestClient.get(
      url,
      headers
    )
    JSON.parse(result)
  end
end
