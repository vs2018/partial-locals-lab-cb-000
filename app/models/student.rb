# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students
  
  def self.search(student_name)
    student = student_name.downcase
    if student_name == ''
      return Student.all
    else
      Student.where("lower(name) = ?", student.downcase)
    end
  end
end

# context 'when it receives an empty search argument' do
#       it 'returns all students' do
#         expect(Student.search('').count).to eq(Student.all.count)
#       end
#     end

#     context 'when it receives a search query' do
#       it 'returns all students whose names contain the given string' do
#         expect(Student.search('rob').map {|s| s.name}).to match_array(['Robert', 'Roberta'])
#       end
#     end
#   end