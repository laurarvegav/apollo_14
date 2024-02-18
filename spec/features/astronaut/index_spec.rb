require 'rails_helper'

RSpec.describe 'Astronaut Index Page', type: :feature do
  describe 'As a visitor' do
    before(:each) do
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

    #User story 1
    it 'displays a a list of astronauts with name, age and job' do
      # As a visitor,
      # When I visit the Astronauts index page ('/astronauts')
      visit "/astronauts"
      # I see a list of astronauts with the following info:
      within ".astronaut-#{@astronaut_1.id}" do
        # - Name
        expect(page).to have_content("Name: Neil Armstrong")
        # - Age
        expect(page).to have_content("Age: 37")
        # - Job
        expect(page).to have_content("Job: Commander")
      end
    end

    #User story 2
    it 'displays the average age of all astronauts' do
      # As a visitor,
      # When I visit the Astronauts index page ('/astronauts')
      visit "/astronauts"
      # I see the average age of all astronauts.
      # (e.g. "Average Age: 34")
      expect(page).to have_content("Average Age: 39")
    end

    #User story 3
    it 'displays the average age of all astronauts' do
      # As a visitor,
      # When I visit the Astronauts index page ('/astronauts')
      visit "/astronauts"
      # I see a list of the space missions' in alphabetical order for each astronaut.
      # (e.g "Apollo 13" 
      # "Capricorn 4"
      # "Gemini 7")
      within ".astronaut-#{@astronaut_1.id}" do
        within "#missions" do
          expect("Apollo 13").to appear_before("Capricorn 4")
          expect("Capricorn 4").to appear_before("Gemini 7")
        end
      end
    end

    #User story 4
    it 'displays the average age of all astronauts' do
      # As a visitor,
      # When I visit the Astronauts index page ('/astronauts')
      visit "/astronauts"
      # I see the total time in space for each astronaut.
      within ".astronaut-#{@astronaut_1.id}" do
        #(e.g. "Name: Neil Armstrong, Age: 37, Job: Commander, Total Time in Space: 760 days")
        expect(page).to have_content("Total Time in Space: 28 days")
      end

      within ".astronaut-#{@astronaut_2.id}" do
        #(e.g. "Name: Neil Armstrong, Age: 37, Job: Commander, Total Time in Space: 760 days")
        expect(page).to have_content("Total Time in Space: 23 days")
      end
    end
  end
end