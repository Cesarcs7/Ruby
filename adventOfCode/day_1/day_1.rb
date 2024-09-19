# frozen_string_literal: true

input_file = 'adventOfCode/day_1/inputData.txt'

file_content = File.read(input_file)

lines = file_content.split("\n")

def create_calibration(line)
  calibration = {
    'first_number' => nil,
    'last_number' => nil
  }

  calibration['first_number'] = get_first_number_from_line(line)
  calibration['last_number'] = get_last_number_from_line(line)

  calibration
end

def get_first_number_from_line(line)
  line.each_char do |char|
    if char.to_i.positive?
      return char
      break
    end
  end
end

def get_last_number_from_line(line)
  line.reverse.each_char do |char|
    if char.to_i.positive?
      return char
      break
    end
  end
end

def perform_sum(lines)
  result = 0
  lines.each do |line|
    calibration = create_calibration(line)
    digit = calibration['first_number'] + calibration['last_number']
    result += digit.to_i
  end
  result
end

final_result = perform_sum(lines)
puts final_result
