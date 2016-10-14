Given(/^I get an exam$/) do
  @header = {"Accept": "application/json"}
  @response = HTTParty.get("http://localhost:8088/exame/q?q=Ultrassom",{
  	:headers => @header
  	})
end

Then(/^I should obtain success$/) do
  fail "HTTP ERROR #{@response.code}#{@response}" unless @response.success?
end
