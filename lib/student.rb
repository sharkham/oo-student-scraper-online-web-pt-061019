class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    student_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(students_array)
    student = Student.new
    students_array.each do |student_mini_hash|
      student_mini_hash.each {|key, value| student.send(("#{key}="), value)}
    end 
    #{:name => "Abby Smith", :location => "Brooklyn, NY", :profile_url => "url"}
  end

  def add_student_attributes(attributes_hash)

    self
  end

  def self.all

  end
end
