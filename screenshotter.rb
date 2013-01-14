require 'sinatra'

class Screenshotter < Sinatra::Base
  get '/' do
    url = params[:url]
    filename = File.join("/", "tmp", "#{Time.new.to_f}.png")

    driver = Capybara::Webkit::Driver.new(Screenshotter)
    driver.browser.visit(url)
    driver.save_screenshot(filename)

    send_file filename
  end
end

