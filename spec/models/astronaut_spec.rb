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
  end

  describe 'Class Methods' do
    describe ".avg_age" do
      it 'returns the correct age average' do
        
        expect(Astronaut.avg_age).to eq(39)
      end
    end
  end
end
