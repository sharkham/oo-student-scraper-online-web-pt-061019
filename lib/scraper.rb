require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    scraped_students = []
    url = open(index_url)
    index_page = Nokogiri::HTML(url)
    index_page.css('div.student-card a').each do |student_card|
      name = student_card.css('h4.student-name').text
      location = student_card.css('p.student-location').text
      profile_url = student_card.attr('href')
      hash  = {
        name: name,
        location: location,
        profile_url: profile_url
      }
      scraped_students << hash
    end
    scraped_students
  end

  def self.scrape_profile_page(profile_url)
    url = open(profile_url)
    profile_page = Nokogiri::HTML(url)
    hash = {}
    data = profile_page.css('div.social-icon-container a').each do |social|
      social_url = social.attr('href')
      if social_url.include? "twitter"
        hash[:twitter] = social_url
      elsif social_url.include? "linkedin"
        hash[:linkedin] = social_url
      elsif social_url.include? "github"
        hash[:github] = social_url
      # elsif social_url.include? "youtube"
      #   hash[:youtube] = social_url
      # elsif social_url.include? "facebook"
      #   hash[:facebook] = social_url
      else
        hash[:blog] = social_url
      end
    end
    hash[:profile_quote] = profile_page.css('div.profile-quote').text
    hash[:bio] = profile_page.css('div.description-holder p').text
    # binding.pry
    hash
    # linkedin_url = profile_page.css()
  end

end
