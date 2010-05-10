require 'dm-core/spec/setup'
require 'dm-core/spec/lib/adapter_helpers'

require 'dm-sweatshop'
require 'dm-migrations'
require 'dm-validations'

Spec::Runner.configure do |config|
  config.extend(DataMapper::Spec::Adapters::Helpers)
end

begin
  Randexp::Dictionary.load_dictionary
rescue RuntimeError
  warn '[WARNING] Neither /usr/share/dict/words or /usr/dict/words found, skipping dm-sweatshop specs'
  exit
end
