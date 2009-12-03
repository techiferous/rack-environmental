require 'rack-plastic'

module Rack
  class Environmental < Plastic
 
    def change_nokogiri_doc(doc)
      add_to_top_of_web_page(doc, create_sticker(doc))
      doc
    end

    private
    
    def add_to_top_of_web_page(doc, node)
      if node
        add_first_child(doc.at_css("body"), node)
      end
    end
 
    def create_sticker(doc)
      environment_name = environment(request.url)
      return nil if environment_name.nil?
      div = create_node(doc, "div", environment_name.to_s)
      div['style'] = style(options[environment_name])
      div
    end
    
    def environment(url)
      url = url.split('//').last # remove http://
      options.each do |environment_name, options|
        if options[:url] && options[:url] =~ url
          return environment_name
        end
      end
      return nil
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
 
  end
end
