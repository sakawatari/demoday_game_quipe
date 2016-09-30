class Tasks::BatchAdventure
    def self.execute
        require 'open-uri'
        require 'nokogiri'

        url = 'http://search.jp.playstation.com/search?site=FIZ02WOB&sort=1&design=2&group=1&charset=UTF-8&ps4Disk=1&ps4Download=1&genre=7&period1=0&period3=0&onsaleAndSoon=1&count=100#search-result'

        charset = nil
        html = open(url) do |f|
            charset = f.charset
            f.read
        end

        doc = Nokogiri::HTML.parse(html, nil, 'utf-8')

        softwares = doc.css(".search-item")
        software_list = softwares.css(".item-info-area")
        software_list.each do |software|
            title = software.css('.item-title').inner_text
            maker = software.css('.item-maker').inner_text
            maker_genre = software.css('.item-genre').inner_text
            release_date = software.css('.item-release-date').inner_text

            gamesoft = { :title => title, :maker => maker, :maker_genre => maker_genre, :release_date => release_date }

            Ps4BasicAdventureList.create(
                title: gamesoft[:title],
                maker: gamesoft[:maker],
                genre: "adventure",
                maker_genre: gamesoft[:maker_genre],
                release_date: gamesoft[:release_date]
                )
        end
    end
end