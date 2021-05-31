def switch_lights(n)
  light_switches = (1..n).to_a.to_h { |s| [s, false] }
  n.times do |i|
    n.times do |j|
      light_switches[j + 1] = !light_switches[j + 1] if (j + 1) % (i + 1) == 0
    end
  end
  light_switches.select { |_, on| on }.keys
end

p switch_lights(5) == [1, 4]
p switch_lights(10) == [1, 4, 9]
p switch_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]