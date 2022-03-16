require "sinatra/base"
require "erb"

class MyApp < Sinatra::Base 
    get "/" do
        "Hello World!"
    end

    get "/hello" do
        "Hello!"
    end

    get "/hello/:name" do
        @name = params["name"]
        erb :first_example
    end

    def store_name(filename, string)
        File.open(filename, "a+") do |file|
            file.puts(string)
        end
    end

    get "/form" do
        erb :form_example
        
    end

    get "/submission" do
        @name = params["name"]
        store_name("name.txt", @name)
        erb :submission_example
    end

    def read_names
        return [] unless File.exist?("name.txt")
        File.read("name.txt").split("\n")
    end
    get "/database" do
        @names_stored = read_names
        erb :database_example
    end
end
