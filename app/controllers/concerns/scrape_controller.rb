require 'nokogiri'
require 'open-uri'

class ScrapeController < ApplicationController

    def popular_destinations

        url = 'https://www.townandcountrymag.com/leisure/travel-guide/g17236981/best-places-to-visit-in-april/'
        doc = Nokogiri::HTML(open(url))
        # destinations = []
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