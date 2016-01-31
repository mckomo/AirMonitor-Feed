module AirMonitor

  class Stations

    def self.supported
      [
          Station.new(id: 6, code: 'MAL005', name: 'Aleja Krasińskiego'),
          Station.new(id: 7, code: 'MAL006', name: 'Nowa Huta'),
          Station.new(id: 16, code: 'MAL015', name: 'Kurdwanów'),
          Station.new(id: 149, code: 'MAL028', name: 'Dielta'),
          Station.new(id: 152, code: 'MAL031', name: 'Piastów'),
          Station.new(id: 153, code: 'MAL032', name: 'Złoty Róg'),
      ]
    end

  end

end