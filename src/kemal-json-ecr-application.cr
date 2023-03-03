module Kemal::Json::Ecr::Application
  VERSION = "0.1.0"
end

require "json"
require "kemal"

struct Data
  include JSON::Serializable
  property id : Int32
  property message : String
end

data_path = File.expand_path("data.json")

data_array = File.open(data_path) do |file|
  Array(Data).from_json(file)
end

get "/" do
  data = data_array
  render "src/views/index.ecr", "src/views/layouts/layout.ecr"
end

Kemal.run
