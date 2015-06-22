module Wonga
  module Daemon
    class PantryEC2InfoUpdateHandler
      def initialize(api_client, logger)
        @logger = logger
        @api_client = api_client
      end

      def handle_message(message)
        id = message['pantry_request_id'] || message['id']
        @logger.info "Updating EC2 info for Request:#{id}, Name:#{message['instance_name']}, InstanceID:#{message['instance_id']}"
        @api_client.send_put_request("/api/ec2_instances/#{id}/update_info_from_aws", message)
      end
    end
  end
end
