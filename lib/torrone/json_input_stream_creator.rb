require 'json'

module Torrone
  class JsonInputStreamCreator
    class << self
      def to_stream(data)
        _String = Rjb::import 'java.lang.String'
        _ByteArrayInputStream = Rjb::import 'java.io.ByteArrayInputStream'
  
        data = normalize_data(data)
        data = _String.new(data)
  
        _ByteArrayInputStream.new(data.getBytes())
      end
  
      private
  
      def normalize_data(data)
        return data.to_json if data.kind_of?(Array)
        return data.to_json if data.kind_of?(Hash)
        data
      end      
    end
  end
end