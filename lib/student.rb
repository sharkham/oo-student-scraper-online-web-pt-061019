class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    student_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(students_array)
    student = Student.new
    students_array.each do |student|
      student.each {|key, value| student.send(("#{key}="), value)}
      @@all << student
    end
    #{:name => "Abby Smith", :location => "Brooklyn, NY", :profile_url => "url"}
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    self
  end

  def self.all
    @@all
  end
end
