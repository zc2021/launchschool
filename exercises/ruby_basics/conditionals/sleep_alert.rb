status = ['awake', 'tired'].sample

alert = status == 'awake' ? 'Be productive!' : 'Go to sleep!'

puts alert
