GRADE_LIM = { "A" => [90, 101], "B" => [80, 90], "C" => [70, 80], "D" => [60, 70], "F" => [0,60] }

def get_grade(grade_one, grade_two, grade_three)
  avg_grade = (grade_one + grade_two + grade_three) / 3
  grade = GRADE_LIM.select { |_, range| avg_grade >= range[0] && avg_grade < range[1] }
  grade.keys[0]
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"