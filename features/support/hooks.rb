Before do |scenario|
    @vigilante = Vigilante.new

    $feature = get_feature_name(scenario.location)
    $scenario = scenario.name
end

AfterStep do |result, steps|
    add_screenshot
end
  
After do |scenario|
    if scenario.failed?
        add_screenshot
        add_browser_logs
    end
end

def get_feature_name(location)
    string = File.read(location.file)
    document = ::Gherkin::Parser.new.parse(string)
    document.feature.name
end

def add_screenshot
    attach("data:image/png;base64,#{page.driver.browser.screenshot_as(:base64)}", "image/png")
end

def add_browser_logs
    time_now = Time.now
    # Getting current URL
    current_url = Capybara.current_url.to_s
    # Gather browser logs
    logs = page.driver.browser.manage.logs.get(:browser).map { |line| [line.level, line.message] }
    # Remove warnings and info messages
    logs.reject! { |line| ["WARNING", "INFO"].include?(line.first) }
    logs.any? == true
    attach(time_now.strftime("%d/%m/%Y %H:%M:%S" + "\n") + ("Current URL: " + current_url + "\n") + logs.join("\n"), "text/plain")
end

at_exit do
    time = Time.now.strftime("%d/%m/%Y %H:%M:%S")
    ReportBuilder.configure do |config|
      config.json_path = "reports/report.json"
      config.report_path = "reports/cucumber_web_report"
      config.report_types = [:html]
      config.report_tabs = %w[Overview Features Scenarios Errors]
      config.report_title = "Cucumber Report Builder web automation test results"
      config.compress_images = false
      config.additional_info = { "Project name" => "Projeto Moin", "Platform" => "SincMarket", "Report generated" => time }
    end
    ReportBuilder.build_report
end