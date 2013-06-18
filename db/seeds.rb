# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Body Type
body_types = %w(thin overweight skinny average fit athletic jacked little_extra curvy full_figured used_up)

body_types.each do |name|
  unless BodyType.find_by_name(name)
    BodyType.create(name: name)
  end
end

# Hair Colors
hair_colors = %w(blonde auburn black red grey brown brunette)

hair_colors.each do |name|
  unless HairColor.find_by_name(name)
    HairColor.create(name: name)
  end
end

# Eyes Colors
eyes_colors = %w(grey green blue brown dark)

eyes_colors.each do |name|
  unless EyesColor.find_by_name(name)
    EyesColor.create(name: name)
  end
end

# Relationship Statuses
relationship_statuses = %w(single_never_married single_and_divorced single_separated single_widowed in_a_relationship)

relationship_statuses.each do |name|
  unless RelationshipStatus.find_by_name(name)
    RelationshipStatus.create(name: name)
  end
end

# Education
educations = %w(doctorate masters bachelors associates some_college high_school did_not_complete_highschool)

educations.each do |name|
  unless Education.find_by_name(name)
    Education.create(name: name)
  end
end

# attractiveness
attractivenesses = %w(not_very_attractive average above_average could_be_model)

attractivenesses.each do |name|
  unless Attractiveness.find_by_name(name)
    Attractiveness.create(name: name)
  end
end

# smokes
smokes = %w(_yes sometimes when_drinking trying_quit _no)

smokes.each do |name|
  unless Smoke.find_by_name(name)
    Smoke.create(name: name)
  end
end

# drinks
drinks = %w(very_often often socially rarely desperately not_at_all)

drinks.each do |name|
  unless Drink.find_by_name(name)
    Drink.create(name: name)
  end
end

# look_for
look_for = %w(dates marriage friends activity_partners)

look_for.each do |name|
  unless LookFor.find_by_name(name)
    LookFor.create(name: name)
  end
end

# ethnicity
ethnicity = %w(europeans indians asians)

ethnicity.each do |name|
  unless Ethnicity.find_by_name(name)
    Ethnicity.create(name: name)
  end
end
