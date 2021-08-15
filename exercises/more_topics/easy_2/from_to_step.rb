def step(start, stop, step)
  counter = start
  while counter <= stop
    yield counter
    counter += step
  end
end
