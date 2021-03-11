namespace :api do
  desc 'Build API documentation'
  task documentation: :environment do
    input_file = 'docs/api/documentation.md'
    output_file = 'public/api/documentation.html'

    system("bin/yarn run aglio -i #{input_file}  -o #{output_file}")
  end

  desc "Generate JSON schemas"
  task :schemas do
    schemas_path = "test/support/api/schemas"
    input_file = "docs/api/documentation.md"
    output_file = "test/support/api/schemas/schemas.json"

    puts "Generating api schemas from #{input_file}"
    system("bin/yarn run apib2json --pretty -i #{input_file} -o #{output_file}")

    if File.exist?(output_file)
      file_path = Pathname.new(output_file)

      JSON.parse(file_path.read).each_pair do |group, actions|
        actions.each do |action|
          next if action.dig("meta", "type") != "response"

          verb = group.scan(/\[(.*)\]/).flatten.first
          name = "#{verb}-#{I18n.transliterate(action.dig('meta', 'group'))}(#{action.dig('meta', 'statusCode')})#{action.dig('meta', 'title')&.gsub(/ /, '-')}".
            sub(/\{.*\}/, "").gsub(/\(|\)/, "-").gsub(/^-|-$/, "")
          puts "Writing #{name}#{dash_version}"
          File.open("#{schemas_path}/#{name}#{dash_version}.json", "w") { |file| file.write(action.dig("schema").to_json) }
        end
      end
    end

    puts "Schemas are ready at #{schemas_path}"
  end
end
