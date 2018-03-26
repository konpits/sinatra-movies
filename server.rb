require 'webrick'
require 'erb'

require_relative 'main'





#movies.each {|movie| puts movie.title}

class Router < WEBrick::HTTPServlet::AbstractServlet
    def do_GET(request, response)
        case request.path
        when '/'
            response.status = 200
            response['Content-Type'] = 'text/html'
            movies = Movie.order(:year).last(20)
            renderer = ERB.new(html_file("index.html.erb"))
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