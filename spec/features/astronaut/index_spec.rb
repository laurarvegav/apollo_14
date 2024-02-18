require 'rails_helper'

RSpec.describe 'Astronaut Index Page', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @astronaut_1 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @astronaut_2 = Astronaut.create!(name: "Diana Trujillo", age: 41, job: "Engineering team lead")
    end

    #User story 1
    it 'displays a a list of astronauts with name, age and job' do
      # As a visitor,
      # When I visit the Astronauts index page ('/astronauts')
      visit "/astronauts"
      # I see a list of astronauts with the following info:
      within "#astronaut-#{@astronaut_1.id}" do
        # - Name
        expect(page).to have_content("Name: Neil Armstrong")
        # - Age
        expect(page).to have_content("Age: 37")
        # - Job
        expect(page).to have_content("Job: Commander")
      end
    end
  end
end