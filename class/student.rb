require_relative 'person'

class Student < Person
  def initialize(classroom)
    super
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
