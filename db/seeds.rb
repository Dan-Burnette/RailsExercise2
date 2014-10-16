Mario = User.create(name: "Mario")
Peach = User.create(name: "Peach")
Bowser = User.create(name: "Bowser")
SomeDude = User.create(name: "Toad")

PlatformingClass = Cohort.create(name: "Platforming Class")
PlatformingClass.memberships.create(role: "Teacher", user_id: Mario.id)
PlatformingClass.memberships.create(role: "Student", user_id: Peach.id)
PlatformingClass.memberships.create(role: "Student", user_id: Bowser.id)