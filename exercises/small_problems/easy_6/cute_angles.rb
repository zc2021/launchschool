DEGREE = "\xC2\xB0"

def string_template(d, m, s)
  %(#{d}#{DEGREE}%02d'%02d") % [m, s]
end

def dms(degrees)
  deg = degrees.floor
  min = ((degrees - deg) * 60).floor
  sec = ((((degrees - deg) * 60) - min) * 60).floor
  string_template(deg, min, sec)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")