require 'webrick'
require 'erb'

require_relative 'model'


class Router < WEBrick::HTTPServlet::AbstractServlet
    def do_GET(request, response)
        case request.path
        when '/'
            response.status = 200
            response['Content-Type'] = 'text/html'
            movies = Movie.order(:id).last(20)
            renderer = ERB.new(html_file("index.html"))
            response.body = renderer.result(binding)
        end
    end

    def do_POST(request, response)
        case request.path
        when '/add-movie'
            response.status = 201
            response['Content-Type'] = 'text/html'
            new_movie = Movie.create(
                title: request.query['title'],
                year: request.query['year'],
                director: request.query['director'],
                cast: request.query['cast'],
                genre: request.query['genre'],
                notes: request.query['notes'],
            )
            renderer = ERB.new(html_file("added_movie.html"))
            response.body = renderer.result(binding)
        end
    end


    private
    def html_file(file)
        path = File.join(__dir__, 'public', file)
        html = File.open(path).read
        return html
    end
end

server = WEBrick::HTTPServer.new(Port: 3000)
trap 'INT' do server.shutdown end
server.mount '/', Router
server.start