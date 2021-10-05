require 'webdrivers'
require 'rspec'

driver = Selenium::WebDriver.for :chrome

describe "Check searchbar functionality" do
  it "Makes sure the searchbar searches for the correct term" do
    driver.navigate.to "https://www.aol.com/"

    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until {driver.find_element(id: 'header-form').displayed?}

    searchbar = driver.find_element(id: 'header-form-search-input')

    searchbar.send_keys ('Test Search')

    driver.find_element(id: 'header-form-search-button').click
    expect(driver.current_url).to eql("https://search.aol.com/aol/search?q=Test+Search&rp=&s_chn=prt_bon&s_it=comsearch")
    puts "Success"
    sleep 3
    # driver.quit
  end
end

describe "Navigate to 'News' Page" do
  it "Navigates to the 'News' page" do
    driver.navigate.to "https://www.aol.com/"
    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until {driver.find_element(class: 'news-link').displayed?}

    driver.find_element(class: 'news-link').click
    expect(driver.current_url).to eql("https://www.aol.com/news/?icid=aol.com-nav")
    puts "News Success"
    sleep 3
    driver.quit
  end
end
