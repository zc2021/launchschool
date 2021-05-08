DASH_POSITIONS = [8, 13, 18, 23]
UUID_LENGTH = 32

def uuid
  uuid_string = ''
  (0...UUID_LENGTH).each do |idx| 
    char = Random.rand(16)
    uuid_string << "%x" % [char] 
  end
  DASH_POSITIONS.each { |idx| uuid_string.insert(idx, '-')}
  uuid_string
end

p uuid
