class Application
  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new

    @@items.each do |item|
      resp.write "#{item}\n"
    end
  elsif req.path.match(/cart/)
    if @@cart.empty?
      resp.write "Your cart is empty"
    else
      @@cart.each do |item|
        resp.write "#{item}\n"
      end
    end
  elsif req.path.match(/add/)
    item = req.params["item"]
    resp.write check_item(item)


    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)

       resp.finish
     end

     def check_item(item)
       if @@item.include? item
         @@cart <<item
         resp.write "added #{item}"

           else
              resp.write "We don't have that item!"
            end
          end
          def handle_search(search_term)
            if @@items.include?(search_term)
              return "#{search_term}"= is one of our items"
