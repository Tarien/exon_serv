-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 400,
		multiplier = 30
	}, {
		minlevel = 401,
		maxlevel = 500,
		multiplier = 25
	}, {
		minlevel = 501,
		maxlevel = 550,
		multiplier = 20
	}, {
		minlevel = 551,
		maxlevel = 600,
		multiplier = 15
	}, {
		minlevel = 601,
		multiplier = 15
	}
}
