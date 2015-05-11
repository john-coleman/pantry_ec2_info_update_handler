require 'spec_helper'
require_relative '../../pantry_ec2_info_update_handler/pantry_ec2_info_update_handler'

RSpec.describe Wonga::Daemon::PantryEC2InfoUpdateHandler do
  let(:config) do
    {
      'pantry' => {
        'api_key' => 'some_api_key',
        'request_timeout' => 10,
        'url' => 'http://some.url'
      }
    }
  end
  let(:logger) { instance_double('Logger').as_null_object }

  subject { Wonga::Daemon::PantryEC2InfoUpdateHandler.new(config, logger) }

  it_behaves_like 'handler'
end
