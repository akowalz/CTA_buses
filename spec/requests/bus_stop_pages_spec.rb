require 'spec_helper'

describe "Bus Stops" do 

  describe "Index page" do
    it "should have content 'Stops'" do
      visit bus_stops_path
      expect(page).to have_content('Stops')
    end
    it "should have content 'Routes'" do
      visit bus_stops_path 
      expect(page).to have_content('Routes')  
    end

  end   

  describe "Show page" do
    it "should have content 'Stop 1'" do
      stop =  FactoryGirl.create(:bus_stop) 
      visit bus_stop_path(1)
      expect(page).to to_have_content('Stop 1')
    end
  end

end