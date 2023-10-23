class Pair < ApplicationRecord
  has_many :student
  
    belongs_to :student1, class_name: 'User', foreign_key: 'student1_user_id'
  belongs_to :student2, class_name: 'User', foreign_key: 'student2_user_id'

  def self.generate_pairs
    # gets and reshuffles students from the database
    students = self.all.shuffle
    # initialize an empty array
    pairs = []
    # iterate over the students array two at a time
    students.each_slice(2) do |student1, student2|
      # creates a new pair object and adds it to the pairs array
      pairs << Pair.create(student1: student1, student2: student2)
    end
    # if there are an odd number of students, the last one is not in a pair, so we need to create a solo pair for that student
    pairs << Pair.create(student1: students.last) if students.length.odd?
    # returns all the pairs of students
    puts
    return pairs
  end 
end

