require 'rspec'
require 'pry'
require './lib/school'

RSpec.describe School do
  context 'Iteration 1' do
    it 'exists' do
      school = School.new('9:00', 7)

      expect(school).to be_a(School)
    end

    it 'has a start time' do
      school = School.new('9:00', 7)

      expect(school.start_time).to eq('9:00')
    end

    it 'has hours in a school day' do
      school = School.new('9:00', 7)

      expect(school.hours_in_school_day).to eq(7)
    end

    it 'starts with no student names' do
      school = School.new('9:00', 7)

      expect(school.student_names).to eq([])
    end
  end

  context 'Iteration 2' do
    it 'can add student names' do
      school = School.new('9:00', 7)

      school.add_student_name('Aurora')
      school.add_student_name('tim')
      school.add_student_name('megan')

      expect(school.student_names).to eq(['Aurora', 'tim', 'megan'])
    end

    it 'can calculate end time' do
      school_1 = School.new('9:00', 7)
      school_2 = School.new('9:00', 3)

      expect(school_1.end_time).to eq('16:00')
      expect(school_2.end_time).to eq('12:00')
    end
  end

  context 'Iteration 3' do
    it 'can be full time or not' do
      school_1 = School.new('9:00', 7)
      school_2 = School.new('9:00', 3)

      expect(school_1.is_full_time?).to eq(true)
    end
    it 'can return capitalized names' do
      school_1 = School.new('9:00', 7)
      school_2 = School.new('9:00', 3)

      school_1.add_student_name('Aurora')
      school_1.add_student_name('tim')
      school_1.add_student_name('megan')

      expect(school_1.standard_student_names).to eq(['Aurora', 'Tim', 'Megan'])
    end
  end

  context 'Iteration 4' do
    it 'can return end time in 12hr format' do
      school_1 = School.new('9:00', 7)
      school_2 = School.new('6:00', 4)
      expect(school_1.convert_end_time_to_clock_time).to eq("4:00PM")
      expect(school_2.convert_end_time_to_clock_time).to eq("10:00AM")
    end
  end
end
