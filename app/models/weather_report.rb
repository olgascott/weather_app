class WeatherReport < ActiveRecord::Base

  def self.get_weather(city)
    raw_result = OpenWeather::Current.city(city)
    return false unless raw_result["cod"] == 200 #Return false if city wasn't found, or something went wrong

    {
      city: raw_result["name"],
      country: raw_result["sys"]["country"],
      temperature: raw_result["main"]["temp"],
      icon_code: raw_result["weather"][0]["icon"],
      sunrise: Time.at(raw_result["sys"]["sunrise"]).strftime("%k:%M"),
      sunset: Time.at(raw_result["sys"]["sunset"]).strftime("%k:%M")
    }
  end
end
