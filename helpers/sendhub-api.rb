helpers do

  class SendHubParty
    include HTTParty
    headers 'Content-Type' => 'application/json'

    def initialize
      @contact_route = 'https://api.sendhub.com/v1/contacts/'
      @message_route = 'https://api.sendhub.com/v1/messages/'
    end

    def get_contacts
      response = self.class.get(@contact_route, { query: { username: ENV['PN'], api_key:ENV['SENDHUB_KEY']} })
      response['objects']
    end

    def new_contact(name, phone_number)

      response = self.class.post(@contact_route,
        { :query => { username: ENV['PN'], api_key:ENV['SENDHUB_KEY']},
        :body => {"name" => name, "number" => phone_number}.to_json,
        :headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json'}
        })
    end

    def send_message(contact_id, message)
      response = self.class.post(@message_route,
        { :query => { username: ENV['PN'], api_key:ENV['SENDHUB_KEY']},
        :body => {"contacts" => [contact_id], "text" => message }.to_json,
        :headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json'}
        })
    end

  end

end
