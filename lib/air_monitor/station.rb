module AirMonitor

  class Station < Resource

    attr_accessor :id, :code, :name, :channels

    def self.all
      [
          Station.new(
              id: 6,
              code: 'MAL005',
              name: 'Aleja Krasińskiego',
              channels: [
                  Channel.new(id: 1711, code: 'MAL005-BZN',   subject_code: 'BZN'),
                  Channel.new(id: 44,   code: 'MAL005-NO2',   subject_code: 'NO2'),
                  Channel.new(id: 46,   code: 'MAL005-PM10',  subject_code: 'PM10'),
                  Channel.new(id: 202,  code: 'MAL005-PM25',  subject_code: 'PM2.5'),
                  Channel.new(id: 43,   code: 'MAL005-NO',    subject_code: 'NO'),
                  Channel.new(id: 42,   code: 'MAL005-CO',    subject_code: 'CO'),
                  Channel.new(id: 45,   code: 'MAL005-NOx',   subject_code: 'NOx')
              ]
          ),
      ]
    end


  end

end