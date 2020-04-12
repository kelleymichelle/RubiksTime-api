require 'nokogiri'
require 'open-uri'

class ScrapeController < ApplicationController

    def wca_events

        url = 'https://www.worldcubeassociation.org/competitions?utf8=%E2%9C%93&region=_North+America&search=&state=present&year=all+years&from_date=&to_date=&delegate=&display=list'
        doc = Nokogiri::HTML(open(url))

        events = doc.css('.list-group-item.not-past')
        wc_events = events.map do |event|
            {
            date: event.css('.date').text.strip,
            name: event.css('.competition-link').text.strip,
            location: event.css('.location').text.strip
            }
        end
        render json: {results: wc_events}
    end
end 