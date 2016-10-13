# frozen_string_literal: true
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
            Channel.new(id: 45, code: 'MAL005-NOx', subject_code: 'NOx'),
            Channel.new(id: 1711, code: 'MAL005-BZN',   subject_code: 'BZN'),
            Channel.new(id: 42,   code: 'MAL005-CO',    subject_code: 'CO'),
            Channel.new(id: 46,   code: 'MAL005-PM10',  subject_code: 'PM10'),
            Channel.new(id: 44,   code: 'MAL005-NO2',   subject_code: 'NO2'),
            Channel.new(id: 43,   code: 'MAL005-NO',    subject_code: 'NO'),
            Channel.new(id: 202,  code: 'MAL005-PM25',  subject_code: 'PM2.5')
          ]
        ),
        Station.new(
          id: 7,
          code: 'MAL006',
          name: 'Nowa Huta',
          channels: [
            Channel.new(id: 54, code: 'MAL006-NO2', subject_code: 'NO2'),
            Channel.new(id: 55,   code: 'MAL006-NOx',   subject_code: 'NOx'),
            Channel.new(id: 211,  code: 'MAL006-PM25',  subject_code: 'PM2.5'),
            Channel.new(id: 57,   code: 'MAL006-PM10',  subject_code: 'PM10'),
            Channel.new(id: 49,   code: 'MAL006-BZN',   subject_code: 'BZN'),
            Channel.new(id: 53,   code: 'MAL006-NO',    subject_code: 'NO'),
            Channel.new(id: 61,   code: 'MAL006-SO2',   subject_code: 'SO2'),
            Channel.new(id: 50,   code: 'MAL006-CO',    subject_code: 'CO')
          ]
        ),
        Station.new(
          id: 16,
          code: 'MAL015',
          name: 'Kurdwanów',
          channels: [
            Channel.new(id: 144, code: 'MAL015-NO2', subject_code: 'NO2'),
            Channel.new(id: 145,   code: 'MAL015-NOx',   subject_code: 'NOx'),
            Channel.new(id: 149,   code: 'MAL015-SO2',   subject_code: 'SO2'),
            Channel.new(id: 143,   code: 'MAL015-NO',    subject_code: 'NO'),
            Channel.new(id: 148,   code: 'MAL015-PM10',  subject_code: 'PM10'),
            Channel.new(id: 242,   code: 'MAL015-PM25',  subject_code: 'PM2.5'),
            Channel.new(id: 146,   code: 'MAL015-O3',    subject_code: 'O3')
          ]
        ),
        Station.new(
          id: 149,
          code: 'MAL028',
          name: 'Dietla',
          channels: [
            Channel.new(id: 1725,   code: 'MAL028-NO2',   subject_code: 'NO2'),
            Channel.new(id: 1723,   code: 'MAL028-PM10',  subject_code: 'PM10'),
            Channel.new(id: 1724,   code: 'MAL028-NO',    subject_code: 'NO'),
            Channel.new(id: 1726,   code: 'MAL028-NOx',   subject_code: 'NOx')
          ]
        ),
        Station.new(
          id: 152,
          code: 'MAL031',
          name: 'Piastów',
          channels: [
            Channel.new(id: 1747,   code: 'MAL031-PM10',  subject_code: 'PM10')
          ]
        ),
        Station.new(
          id: 153,
          code: 'MAL032',
          name: 'Złoty Róg',
          channels: [
            Channel.new(id: 1752,   code: 'MAL032-PM10',  subject_code: 'PM10')
          ]
        )
      ]
    end
  end
end
