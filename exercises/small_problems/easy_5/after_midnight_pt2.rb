HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time)
  hours, mins = time.split(':')
  ((hours.to_i * MINUTES_PER_HOUR) + mins.to_i) % MINUTES_PER_DAY
end

def before_midnight(time)
  (MINUTES_PER_DAY - after_midnight(time)) % MINUTES_PER_DAY
end

puts(before_midnight('12:34'))

puts(after_midnight('00:00') == 0)
puts(before_midnight('00:00') == 0)
puts(after_midnight('12:34') == 754)
puts(before_midnight('12:34') == 686)
puts(after_midnight('24:00') == 0)
puts(before_midnight('24:00') == 0)