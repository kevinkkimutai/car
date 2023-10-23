class Student < ApplicationRecord
  belongs_to :user
  has_many :pairs


  #validations
  validates :fullname, presence: true
  validates :grade, presence: true

  #defines the generation of pairs
  def self.generate_pairs
    #gets and reshuffles students from the database
    students = self.all.shuffle
    #initialize an empty array
    pairs = []
    #iterate over the students array two at a time
    students.each_slice(2) do |student1,student2|
#creates a new pair object and adds it to the pairs array
      pairs << Pair.create(student1:student1,student2:student2)
    end
    #returns all the pairs of students
    return pairs
  end 
end
