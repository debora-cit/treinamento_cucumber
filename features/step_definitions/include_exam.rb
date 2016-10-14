Given(/^I include  a new exam$/) do
  @createbody  = {"code": "USG", "name": "Ultrassom Teste", "tag": "Ultrason" }.to_json
  @header = {"Content-Type" => "application/json"}
  @response = HTTParty.post("http://localhost:8088/exame", {
  	:body => @createbody,
  	:headers => @header
  	})
  @id = @response["_id"]
  @rev = @response["_rev"]
end

Then(/^I should obtain success$/) do
  fail "HTTP ERROR #{@response.code}#{@response}" unless @response.success?
end

Given(/^I include the same exam$/) do
  @createbody  = {"_id": @id, "code": "USG", "name": "Ultrassom Teste", "tag": "Ultrason" }.to_json
  @header = {"Content-Type" => "application/json"}
  @response = HTTParty.post("http://localhost:8088/exame", {
  	:body => @createbody,
  	:headers => @header
  	})
end

Given(/^I include an exam without fields$/) do
  @createbody  = {}.to_json
  @header = {"Content-Type" => "application/json"}
  @response = HTTParty.post("http://localhost:8088/exame", {
  	:body => @createbody,
  	:headers => @header
  	})
end

Then(/^the fields should be empty$/) do
  expect(@response["name"]).to eq(nil) 
  expect(@response["code"]).to eq(nil)
  expect(@response["tag"]).to eq(nil)
end






