class Screenshot
  def self.take(url)
    filename = File.join("/", "tmp", "#{Time.new.to_f}.png")

    task = lambda {
      driver = Capybara::Webkit::Driver.new(Screenshotter)
      driver.browser.visit(url)
      driver.save_screenshot(filename)
    }

    if xvfb?
      Headless.ly { task.call }
    else
      task.call
    end

    filename
  end

  private
  def self.xvfb?
    `which Xvfb`.strip != ""
  end
end