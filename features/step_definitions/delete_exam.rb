Given(/^I exclude an exam$/) do
  @header = {"Accept": "application/json"}
  @response = HTTParty.delete("http://localhost:8088/exame/#{@id}",{
  	:headers => @header
  	})
end

Given(/^I exclude an exam by cloudant$/) do  
  @createbody = {"docs":[{"_id": @id,"_rev": @rev,"_deleted": true}]}.to_json
  puts @createbody
  @header = {"Content-Type" => "application/json"}
  @response = HTTParty.post("http://localhost:8080/dasa/_bulk_docs", {
  	:body => @createbody,
  	:headers => @header
  	})
  puts @response
end

And(/^I should obtain success on cloudant$/) do
  puts @response
  expect(@response[0]["ok"]).to eq(true) 
  expect(@response).not_to be_empty
  @response.size.should be > 0
end

Then(/^The response code should be "([^"]*)"$/) do |code|
  expect(@response.code).to eq(code.to_i)
end

Given(/^I exclude an invalid exam$/) do
  @header = {"Accept": "application/json"}
  @response = HTTParty.delete("http://localhost:8088/exame/123",{
  	:headers => @header
  	})
end




