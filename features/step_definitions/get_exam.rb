Given(/^I get an exam$/) do
  @header = {"Accept": "application/json"}
  @response = HTTParty.get("http://localhost:8088/exame/q?q=Ultrassom",{
  	:headers => @header
  	})
 end

 Given(/^I get an exam no existent$/) do
  @header = {"Accept": "application/json"}
  @response = HTTParty.get("http://localhost:8088/exame/q?q=?",{
  	:headers => @header
  	})
  puts @response
end

Then(/^I should obtain fail$/) do
  fail "HTTP ERROR #{@response.code}#{@response}" unless !(@response.success?)
end

