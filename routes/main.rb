get '/' do
  sendhub = SendHubParty.new
  @all_contacts = sendhub.get_contacts
  erb :index
end