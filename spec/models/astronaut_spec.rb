require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  before do
    @astronaut_1 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
    @astronaut_2 = Astronaut.create!(name: "Diana Trujillo", age: 41, job: "Engineering team lead")

    @mission_1 = Mission.create!(title: "Capricorn 4", time_in_space: 5) 
    @mission_2 =Mission.create!(title:  "Gemini 7", time_in_space: 10)
    @mission_3 =Mission.create!(title: "Apollo 13", time_in_space: 13)

    AstronautMission.create!(astronaut: @astronaut_1, mission: @mission_1)
    AstronautMission.create!(astronaut: @astronaut_1, mission: @mission_2)
    AstronautMission.create!(astronaut: @astronaut_1, mission: @mission_3)
    AstronautMission.create!(astronaut: @astronaut_2, mission: @mission_2)
    AstronautMission.create!(astronaut: @astronaut_2, mission: @mission_3)
  end

  describe 'Class Methods' do
    describe ".avg_age" do
      it 'returns the correct age average' do
        
        expect(Astronaut.avg_age).to eq(39)
      end
    end
  end

  describe 'Instance Methods' do
    describe "#org_missions" do
      it 'returns an array of missions by alphabetical order' do
        
        expect(@astronaut_1.org_missions).to eq([@mission_3, @mission_1, @mission_2])
        expect(@astronaut_2.org_missions).to eq([@mission_3, @mission_2])
      end
    end

    describe "#total_time_in_space" do
      it 'returns the total time an astronaut will be in space' do
        
        expect(@astronaut_1.total_time_in_space).to eq(28)
        expect(@astronaut_2.total_time_in_space).to eq(23)
      end
    end
  end
end
