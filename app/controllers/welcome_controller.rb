class WelcomeController < ApplicationController
    def index
        render html: "<h2>Hello World</h2><p>The time is now: #{Time.now}</p>".html_safe
    end
end
