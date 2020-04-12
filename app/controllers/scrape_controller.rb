require 'nokogiri'
require 'open-uri'

class ScrapeController < ApplicationController

    def wca_events

        url = 'https://www.worldcubeassociation.org/competitions?utf8=%E2%9C%93&region=_North+America&search=&state=present&year=all+years&from_date=&to_date=&delegate=&display=list'
        doc = Nokogiri::HTML(open(url))

        places = doc.css('.listicle-slide')
        destinations = places.map do |place|
                {
                title: place.css('.listicle-slide-hed-text').text,
                image: place.css('source')[1].values[0],
                description: place.css('p').text
                }
            # destinations << destination
        end
        render json: {results: destinations}
    end
end 