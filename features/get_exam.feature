Feature: Feature to get an exam
	In order to get an exam
	As a consumer
	I should obtain sucess

Scenario: 1 - Get an exam
	Given I get an exam
	Then I should obtain success

Scenario: 2 - Get an exam no existent
	Given I get an exam no existent
	Then I should obtain fail