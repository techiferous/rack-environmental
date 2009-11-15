require 'nokogiri'

module Rack
  class Environmental

    def initialize(app, options = {})
      @app = app
      @options = options
    end
    
    def call(env)
      @request = Rack::Request.new(env)
      status, @headers, @body = @app.call(env)
      if html?
        @body = add_to_top_of_web_page(create_sticker)
        update_content_length
      end
      [status, @headers, @body]
    end
    
    private

    def html?
      @headers["Content-Type"] && @headers["Content-Type"].include?("text/html")
    end
    
    def add_to_top_of_web_page(node)
      if node
        doc.at_css("body").children.first.add_previous_sibling(node)
      end
      doc.to_html
    end

    def create_sticker
      environment_name = environment(@request.url)
      return nil if environment_name.nil?
      div = Nokogiri::XML::Node.new("div", doc)
      div['style'] = style(@options[environment_name])
      div.content = environment_name.to_s
      div
    end
    
    def environment(url)
      url = url.split('//').last  # remove http://
      @options.each do |environment_name, options|
        if options[:url] && options[:url] =~ url
          return environment_name
        end
      end
      return nil
    end

    def doc
      @doc ||= Nokogiri::HTML(body_to_string)
    end
  
    def body_to_string
      s = ""
      @body.each { |x| s << x }
      s
    end
    
    def style(options)
      style = ""
      style << "font-family: Verdana, Arial, sans-serif;"
      style << "font-weight: bold;"
      style << "text-transform: uppercase;"
      style << "text-align: center;"
      style << "color: black;"
      style << "padding: 3px;"
      style << "background-color: #{options[:color] || "blue"};"
      case options[:size]
      when :large
        style << "font-size: 20px;"
      when :medium
        style << "font-size: 14px;"
      when :small
        style << "font-size: 10px;"
      else
        style << "font-size: 14px;"
      end
      if options[:style] == :badge
        style << "margin: 5px;"
        style << "position: fixed;"
        style << "top: #{options[:top] || 5}px;"
        style << "left: #{options[:left] || 5}px;"
        style << "opacity: #{options[:opacity] || 0.7};"
        style << "-moz-border-radius: 5px; -khtml-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"
      else
        style << "margin: 0px;"
      end
    end

    def update_content_length
      @headers['Content-Length'] = Rack::Utils.bytesize(@body).to_s
    end

  end
end
