Feature: Feature to incude new exam
	In order to incude a new exam
	As a consumer
	I should obtain sucess

Scenario: 1 - Include a new exam
	Given I include  a new exam
	Then I should obtain success

Scenario: 2 - Include the same exam
	Given I include  a new exam
	And I include the same exam
	Then I should obtain fail

Scenario: 3 - Include the exam without fields
	Given I include an exam without fields
	Then I should obtain success
	And the fields should be empty

