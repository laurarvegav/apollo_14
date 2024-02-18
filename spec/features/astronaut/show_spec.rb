require 'rails_helper'

RSpec.describe 'Astronaut Show Page', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @astronaut_1 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @astronaut_2 = Astronaut.create!(name: "Diana Trujillo", age: 41, job: "Engineering team lead")

      @mission_1 = Mission.create!(title: "Capricorn 4", time_in_space: 5) 
      @mission_2 =Mission.create!(title:  "Gemini 7", time_in_space: 10)
      @mission_3 =Mission.create!(title: "Apollo 13", time_in_space: 13)
      @mission_4 =Mission.create!(title: "Mars 4", time_in_space: 2)

      AstronautMission.create!(astronaut: @astronaut_1, mission: @mission_1)
      AstronautMission.create!(astronaut: @astronaut_1, mission: @mission_2)
      AstronautMission.create!(astronaut: @astronaut_1, mission: @mission_3)
      AstronautMission.create!(astronaut: @astronaut_2, mission: @mission_2)
      AstronautMission.create!(astronaut: @astronaut_2, mission: @mission_3)
    end
    
    # Extension 1
    it 'displays the name of the astronaut and the missions that they have been on' do
      # As a visitor, 
      # When I visit an astronaut's show page (/astronauts/:id)
      visit "/astronauts/#{@astronaut_1.id}"
      
      # I see the name of that astronaut 
      # (e.g. Neil Armstrong
      expect(page).to have_content("Neil Armstrong")
      # And a list of the missions this astronaut has been on.
      # Missions: Apollo 13, Capricorn 4)
      expect(page).to have_content("Missions: Apollo 13, Capricorn 4, Gemini 7")
    end
    
    #Extension 2
    it 'displays a form to add a mission to this astronaut and succesfully fills it' do
      # As a visitor, 
      # When I visit an astronaut's show page (/astronauts/:id)
      visit "/astronauts/#{@astronaut_1.id}"
      # I see a form to add a mission to this astronaut
      expect(page).to have_content("Add a new mission")

      # When I fill out the form with an ID of an existing mission
      fill_in("Mission id", with: @mission_4.id)
      click_button("Save")
      
      # I am redirected back to the Astronaut's show page
      expect(current_path).to eq("/astronauts/#{@astronaut_1.id}")
      
      # Where I see the new mission's name listed. 
      expect(page).to have_content("Mars 4")
    end
  end
end