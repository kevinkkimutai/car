RSpec.describe Pair do
    describe '.generate_pairs' do
      it 'generates pairs of students' do
        # Create some sample students
        student1 = Student.create(fullname: 'John Omondi')
        student2 = Student.create(fullname: 'Jane Otieno')
        student3 = Student.create(fullname: 'Bob Oyier')
        student4 = Student.create(fullname: 'Alice Oscar')
        # Call the generate_pairs method
        pairs = Pair.generate_pairs
        # Assert that the number of generated pairs is equal to the number of students divided by 2
        expect(pairs.count).to eq((Student.count / 2).ceil)
        # Assert that each pair contains two unique students
        pairs.each do |pair|
          expect(pair.student1).not_to eq(pair.student2)
        end
        # Assert that all students are included in a pair
        expect(pairs.flat_map(&:students).sort).to eq(Student.all.sort)
      end
    end
  end


# RSpec.describe Pair do
#     describe '.generate_pairs' do
#       it 'generates pairs of students that are reshuffled weekly in a randomized and automated way' do
#         # Create some sample students
#         student1 = Student.create(fullname: 'John Omondi')
#         student2 = Student.create(fullname: 'Jane Otieno')
#         student3 = Student.create(fullname: 'Bob Oyier')
#         student4 = Student.create(fullname: 'Alice Oscar')
  
#         # Call the generate_pairs method twice to generate pairs for two different weeks
#         pairs1 = Pair.generate_pairs
#         pairs2 = Pair.generate_pairs
  
#         # Assert that the number of generated pairs is equal to the number of students divided by 2
#         expect(pairs1.count).to eq((Student.count / 2).ceil)
#         expect(pairs2.count).to eq((Student.count / 2).ceil)
  
#         # Assert that each pair contains two unique students
#         pairs1.each do |pair|
#           expect(pair.student1).not_to eq(pair.student2)
#         end
  
#         pairs2.each do |pair|
#           expect(pair.student1).not_to eq(pair.student2)
#         end
  
#         # Assert that all students are included in a pair for both weeks
#         expect(pairs1.flat_map(&:students).sort).to eq(Student.all.sort)
#         expect(pairs2.flat_map(&:students).sort).to eq(Student.all.sort)
  
#         # Assert that the generated pairs for the two weeks are different from each other
#         expect(pairs1).not_to eq(pairs2)
#       end
#     end
#   end