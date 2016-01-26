module RemoteSource

  class Measurements

    class << self

      def request(params)

        query = json_query(params)

        if cached?(query)
          cache(query)
        else
          cache(query, connection.post('/dane-pomiarowe/pobierz', query: query))
        end

      end

      private

      def json_query(params)
        {
            measType: 'auto',
            viewType: 'station',
            dateRange: 'day',
            date: params[:date].strftime('%d.%m.%Y'),
            viewTypeEntityId: params[:station_id],
            channels: [44,46,202,43,42,45]
        }.to_json
      end

      def connection
        @connection ||= RemoteSource.connection
      end

      def cached?(key)
        storage.has_key?(key)
      end

      def cache(key, response = nil)
        storage[key] ||= response
      end

      def storage
        @storage ||= {}
      end

    end

  end

end