Before do |scenario|
    @discord = Discord.new

    $feature = get_feature_name(scenario.location)
    $scenario = scenario.name
end

def get_feature_name(location)
    string = File.read(location.file)
    document = ::Gherkin::Parser.new.parse(string)
    document.feature.name
end