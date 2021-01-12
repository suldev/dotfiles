# -*- coding: utf-8 -*-

import requests

CITY = "4560349"
API_KEY = "8660347114bfd1397e7488b93301c9db"
UNITS = "imperial"
UNIT_KEY = "F"

REQ = requests.get("http://api.openweathermap.org/data/2.5/weather?id={}&appid={}&units={}".format(CITY, API_KEY, UNITS))
try:
    if REQ.status_code == 200:
        majkey = REQ.json()["weather"][0]["main"].capitalize()
        minkey = REQ.json()["weather"][0]["description"].capitalize()
        icon = ""
        if majkey == "Thunderstorm":
            icon = "🌩"
        elif majkey == "Snow":
            icon = "🌨"
        elif majkey == "Clear":
            icon = "🌣"
        elif majkey == "Rain" or majkey == "Drizzle":
            icon = "🌧"
        elif majkey == "Fog":
            icon = "🌫"
        elif minkey == "Few clouds":
            icon = "🌤"
        elif minkey == "Scattered clouds":
            icon = "🌥"
        elif minkey == "Broken clouds":
            icon = "🌥"
        elif minkey == "Overcast clouds":
            icon = "☁"
        temp = int(float(REQ.json()["main"]["temp"]))
        print("{}  {}°{}".format(icon,temp,UNIT_KEY))
    else:
        print("Error: http code" + str(REQ.status_code))
except (ValueError, IOError):
    print("Unexpected Error")

