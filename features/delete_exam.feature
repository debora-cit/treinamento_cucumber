Feature: Feature to exclude an exam
	In order to exclude an exam
	As a consumer
	I should obtain sucess

Scenario: 1 - Exclude an exam
	Given I include  a new exam
	And I exclude an exam
	Then I should obtain success

Scenario: 2 - Exclude an invalid exam
	Given I exclude an invalid exam
	Then I should obtain fail

@cloudant
Scenario: 3 - Exclude an exam by cloudant
	Given I include  a new exam
	And I exclude an exam by cloudant
	Then I should obtain success
	And I should obtain success on cloudant
	And The response code should be "201"