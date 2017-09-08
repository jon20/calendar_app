module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Calendar app"
    if page_title.empty?
      base_title
    else 
      page_title
    end
  end
  def weather
    require "json"
    require "open-uri"
  
    url="http://weather.livedoor.com/forecast/webservice/json/v1?city=400010"

    JSON.parse(open(url).read)
  end
end
