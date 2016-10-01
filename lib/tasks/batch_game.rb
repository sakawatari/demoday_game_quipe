class Tasks::BatchGame
    def self.execute
        require 'open-uri'
        require 'nokogiri'

        url = 'http://search.jp.playstation.com/search?query=&charset=UTF-8&count=100&sort=1&onsaleAndSoon=0&site=FIZ02WOB&design=2&period4=9&period3=2016&ps4Disk=1&period2=1&period1=2000&ps4Download=1&group=1&start=800'

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
            released_date = software.css('.item-release-date').inner_text

            gamesoft = { :title => title, :maker => maker, :maker_genre => maker_genre, :released_date => released_date }

            Game.create(
                title: gamesoft[:title],
                maker: gamesoft[:maker],
                maker_genre: gamesoft[:maker_genre],
                released_date: gamesoft[:released_date]
                )
        end
    end
end